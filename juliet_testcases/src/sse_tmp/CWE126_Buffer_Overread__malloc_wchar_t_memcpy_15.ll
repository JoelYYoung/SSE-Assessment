; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_15.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_15_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !23
  %0 = bitcast i8* %call to i32*, !dbg !24
  store i32* %0, i32** %data, align 8, !dbg !25
  %1 = load i32*, i32** %data, align 8, !dbg !26
  %cmp = icmp eq i32* %1, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !32
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !33
  %3 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !36, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !42
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !43
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !44
  store i32 0, i32* %arrayidx3, align 4, !dbg !45
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !46
  %4 = bitcast i32* %arraydecay4 to i8*, !dbg !46
  %5 = load i32*, i32** %data, align 8, !dbg !47
  %6 = bitcast i32* %5 to i8*, !dbg !46
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !48
  %call6 = call i64 @wcslen(i32* %arraydecay5) #9, !dbg !49
  %mul = mul i64 %call6, 4, !dbg !50
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 4 %6, i64 %mul, i1 false), !dbg !46
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !51
  store i32 0, i32* %arrayidx7, align 4, !dbg !52
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !53
  call void @printWLine(i32* %arraydecay8), !dbg !54
  %7 = load i32*, i32** %data, align 8, !dbg !55
  %8 = bitcast i32* %7 to i8*, !dbg !55
  call void @free(i8* %8) #7, !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_15_good() #0 !dbg !58 {
entry:
  call void @goodG2B1(), !dbg !59
  call void @goodG2B2(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #7, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #7, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_15_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_15_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i32* null, i32** %data, align 8, !dbg !85
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !86
  %0 = bitcast i8* %call to i32*, !dbg !87
  store i32* %0, i32** %data, align 8, !dbg !88
  %1 = load i32*, i32** %data, align 8, !dbg !89
  %cmp = icmp eq i32* %1, null, !dbg !91
  br i1 %cmp, label %if.then, label %if.end, !dbg !92

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !93
  unreachable, !dbg !93

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !95
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !96
  %3 = load i32*, i32** %data, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !97
  store i32 0, i32* %arrayidx, align 4, !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !99, metadata !DIExpression()), !dbg !101
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !102
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !103
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !104
  store i32 0, i32* %arrayidx3, align 4, !dbg !105
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !106
  %4 = bitcast i32* %arraydecay4 to i8*, !dbg !106
  %5 = load i32*, i32** %data, align 8, !dbg !107
  %6 = bitcast i32* %5 to i8*, !dbg !106
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !108
  %call6 = call i64 @wcslen(i32* %arraydecay5) #9, !dbg !109
  %mul = mul i64 %call6, 4, !dbg !110
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 4 %6, i64 %mul, i1 false), !dbg !106
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !111
  store i32 0, i32* %arrayidx7, align 4, !dbg !112
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !113
  call void @printWLine(i32* %arraydecay8), !dbg !114
  %7 = load i32*, i32** %data, align 8, !dbg !115
  %8 = bitcast i32* %7 to i8*, !dbg !115
  call void @free(i8* %8) #7, !dbg !116
  ret void, !dbg !117
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !118 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !119, metadata !DIExpression()), !dbg !120
  store i32* null, i32** %data, align 8, !dbg !121
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !122
  %0 = bitcast i8* %call to i32*, !dbg !123
  store i32* %0, i32** %data, align 8, !dbg !124
  %1 = load i32*, i32** %data, align 8, !dbg !125
  %cmp = icmp eq i32* %1, null, !dbg !127
  br i1 %cmp, label %if.then, label %if.end, !dbg !128

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !129
  unreachable, !dbg !129

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !131
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !132
  %3 = load i32*, i32** %data, align 8, !dbg !133
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !133
  store i32 0, i32* %arrayidx, align 4, !dbg !134
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !135, metadata !DIExpression()), !dbg !137
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !138
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !139
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !140
  store i32 0, i32* %arrayidx3, align 4, !dbg !141
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !142
  %4 = bitcast i32* %arraydecay4 to i8*, !dbg !142
  %5 = load i32*, i32** %data, align 8, !dbg !143
  %6 = bitcast i32* %5 to i8*, !dbg !142
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !144
  %call6 = call i64 @wcslen(i32* %arraydecay5) #9, !dbg !145
  %mul = mul i64 %call6, 4, !dbg !146
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 4 %6, i64 %mul, i1 false), !dbg !142
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !147
  store i32 0, i32* %arrayidx7, align 4, !dbg !148
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !149
  call void @printWLine(i32* %arraydecay8), !dbg !150
  %7 = load i32*, i32** %data, align 8, !dbg !151
  %8 = bitcast i32* %7 to i8*, !dbg !151
  call void @free(i8* %8) #7, !dbg !152
  ret void, !dbg !153
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memcpy_15_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 31, column: 27, scope: !16)
!24 = !DILocation(line: 31, column: 16, scope: !16)
!25 = !DILocation(line: 31, column: 14, scope: !16)
!26 = !DILocation(line: 32, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 32, column: 13)
!28 = !DILocation(line: 32, column: 18, scope: !27)
!29 = !DILocation(line: 32, column: 13, scope: !16)
!30 = !DILocation(line: 32, column: 28, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 32, column: 27)
!32 = !DILocation(line: 33, column: 17, scope: !16)
!33 = !DILocation(line: 33, column: 9, scope: !16)
!34 = !DILocation(line: 34, column: 9, scope: !16)
!35 = !DILocation(line: 34, column: 20, scope: !16)
!36 = !DILocalVariable(name: "dest", scope: !37, file: !17, line: 42, type: !38)
!37 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 42, column: 17, scope: !37)
!42 = !DILocation(line: 43, column: 17, scope: !37)
!43 = !DILocation(line: 43, column: 9, scope: !37)
!44 = !DILocation(line: 44, column: 9, scope: !37)
!45 = !DILocation(line: 44, column: 21, scope: !37)
!46 = !DILocation(line: 47, column: 9, scope: !37)
!47 = !DILocation(line: 47, column: 22, scope: !37)
!48 = !DILocation(line: 47, column: 35, scope: !37)
!49 = !DILocation(line: 47, column: 28, scope: !37)
!50 = !DILocation(line: 47, column: 40, scope: !37)
!51 = !DILocation(line: 48, column: 9, scope: !37)
!52 = !DILocation(line: 48, column: 21, scope: !37)
!53 = !DILocation(line: 49, column: 20, scope: !37)
!54 = !DILocation(line: 49, column: 9, scope: !37)
!55 = !DILocation(line: 50, column: 14, scope: !37)
!56 = !DILocation(line: 50, column: 9, scope: !37)
!57 = !DILocation(line: 52, column: 1, scope: !16)
!58 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memcpy_15_good", scope: !17, file: !17, line: 122, type: !18, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 124, column: 5, scope: !58)
!60 = !DILocation(line: 125, column: 5, scope: !58)
!61 = !DILocation(line: 126, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 138, type: !63, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!7, !7, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !17, line: 138, type: !7)
!69 = !DILocation(line: 138, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !17, line: 138, type: !65)
!71 = !DILocation(line: 138, column: 27, scope: !62)
!72 = !DILocation(line: 141, column: 22, scope: !62)
!73 = !DILocation(line: 141, column: 12, scope: !62)
!74 = !DILocation(line: 141, column: 5, scope: !62)
!75 = !DILocation(line: 143, column: 5, scope: !62)
!76 = !DILocation(line: 144, column: 5, scope: !62)
!77 = !DILocation(line: 145, column: 5, scope: !62)
!78 = !DILocation(line: 148, column: 5, scope: !62)
!79 = !DILocation(line: 149, column: 5, scope: !62)
!80 = !DILocation(line: 150, column: 5, scope: !62)
!81 = !DILocation(line: 152, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 59, type: !18, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !17, line: 61, type: !4)
!84 = !DILocation(line: 61, column: 15, scope: !82)
!85 = !DILocation(line: 62, column: 10, scope: !82)
!86 = !DILocation(line: 71, column: 27, scope: !82)
!87 = !DILocation(line: 71, column: 16, scope: !82)
!88 = !DILocation(line: 71, column: 14, scope: !82)
!89 = !DILocation(line: 72, column: 13, scope: !90)
!90 = distinct !DILexicalBlock(scope: !82, file: !17, line: 72, column: 13)
!91 = !DILocation(line: 72, column: 18, scope: !90)
!92 = !DILocation(line: 72, column: 13, scope: !82)
!93 = !DILocation(line: 72, column: 28, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !17, line: 72, column: 27)
!95 = !DILocation(line: 73, column: 17, scope: !82)
!96 = !DILocation(line: 73, column: 9, scope: !82)
!97 = !DILocation(line: 74, column: 9, scope: !82)
!98 = !DILocation(line: 74, column: 21, scope: !82)
!99 = !DILocalVariable(name: "dest", scope: !100, file: !17, line: 78, type: !38)
!100 = distinct !DILexicalBlock(scope: !82, file: !17, line: 77, column: 5)
!101 = !DILocation(line: 78, column: 17, scope: !100)
!102 = !DILocation(line: 79, column: 17, scope: !100)
!103 = !DILocation(line: 79, column: 9, scope: !100)
!104 = !DILocation(line: 80, column: 9, scope: !100)
!105 = !DILocation(line: 80, column: 21, scope: !100)
!106 = !DILocation(line: 83, column: 9, scope: !100)
!107 = !DILocation(line: 83, column: 22, scope: !100)
!108 = !DILocation(line: 83, column: 35, scope: !100)
!109 = !DILocation(line: 83, column: 28, scope: !100)
!110 = !DILocation(line: 83, column: 40, scope: !100)
!111 = !DILocation(line: 84, column: 9, scope: !100)
!112 = !DILocation(line: 84, column: 21, scope: !100)
!113 = !DILocation(line: 85, column: 20, scope: !100)
!114 = !DILocation(line: 85, column: 9, scope: !100)
!115 = !DILocation(line: 86, column: 14, scope: !100)
!116 = !DILocation(line: 86, column: 9, scope: !100)
!117 = !DILocation(line: 88, column: 1, scope: !82)
!118 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 91, type: !18, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!119 = !DILocalVariable(name: "data", scope: !118, file: !17, line: 93, type: !4)
!120 = !DILocation(line: 93, column: 15, scope: !118)
!121 = !DILocation(line: 94, column: 10, scope: !118)
!122 = !DILocation(line: 99, column: 27, scope: !118)
!123 = !DILocation(line: 99, column: 16, scope: !118)
!124 = !DILocation(line: 99, column: 14, scope: !118)
!125 = !DILocation(line: 100, column: 13, scope: !126)
!126 = distinct !DILexicalBlock(scope: !118, file: !17, line: 100, column: 13)
!127 = !DILocation(line: 100, column: 18, scope: !126)
!128 = !DILocation(line: 100, column: 13, scope: !118)
!129 = !DILocation(line: 100, column: 28, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !17, line: 100, column: 27)
!131 = !DILocation(line: 101, column: 17, scope: !118)
!132 = !DILocation(line: 101, column: 9, scope: !118)
!133 = !DILocation(line: 102, column: 9, scope: !118)
!134 = !DILocation(line: 102, column: 21, scope: !118)
!135 = !DILocalVariable(name: "dest", scope: !136, file: !17, line: 110, type: !38)
!136 = distinct !DILexicalBlock(scope: !118, file: !17, line: 109, column: 5)
!137 = !DILocation(line: 110, column: 17, scope: !136)
!138 = !DILocation(line: 111, column: 17, scope: !136)
!139 = !DILocation(line: 111, column: 9, scope: !136)
!140 = !DILocation(line: 112, column: 9, scope: !136)
!141 = !DILocation(line: 112, column: 21, scope: !136)
!142 = !DILocation(line: 115, column: 9, scope: !136)
!143 = !DILocation(line: 115, column: 22, scope: !136)
!144 = !DILocation(line: 115, column: 35, scope: !136)
!145 = !DILocation(line: 115, column: 28, scope: !136)
!146 = !DILocation(line: 115, column: 40, scope: !136)
!147 = !DILocation(line: 116, column: 9, scope: !136)
!148 = !DILocation(line: 116, column: 21, scope: !136)
!149 = !DILocation(line: 117, column: 20, scope: !136)
!150 = !DILocation(line: 117, column: 9, scope: !136)
!151 = !DILocation(line: 118, column: 14, scope: !136)
!152 = !DILocation(line: 118, column: 9, scope: !136)
!153 = !DILocation(line: 120, column: 1, scope: !118)
