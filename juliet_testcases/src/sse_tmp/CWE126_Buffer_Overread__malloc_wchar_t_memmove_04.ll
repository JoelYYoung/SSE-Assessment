; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_04.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_04_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !23
  %0 = bitcast i8* %call to i32*, !dbg !26
  store i32* %0, i32** %data, align 8, !dbg !27
  %1 = load i32*, i32** %data, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !35
  %3 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !44
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !45
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !46
  store i32 0, i32* %arrayidx3, align 4, !dbg !47
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !48
  %4 = bitcast i32* %arraydecay4 to i8*, !dbg !48
  %5 = load i32*, i32** %data, align 8, !dbg !49
  %6 = bitcast i32* %5 to i8*, !dbg !48
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !50
  %call6 = call i64 @wcslen(i32* %arraydecay5) #9, !dbg !51
  %mul = mul i64 %call6, 4, !dbg !52
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %4, i8* align 4 %6, i64 %mul, i1 false), !dbg !48
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !53
  store i32 0, i32* %arrayidx7, align 4, !dbg !54
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !55
  call void @printWLine(i32* %arraydecay8), !dbg !56
  %7 = load i32*, i32** %data, align 8, !dbg !57
  %8 = bitcast i32* %7 to i8*, !dbg !57
  call void @free(i8* %8) #7, !dbg !58
  ret void, !dbg !59
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
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_04_good() #0 !dbg !60 {
entry:
  call void @goodG2B1(), !dbg !61
  call void @goodG2B2(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* null) #7, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #7, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_04_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_04_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !84 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !85, metadata !DIExpression()), !dbg !86
  store i32* null, i32** %data, align 8, !dbg !87
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !88
  %0 = bitcast i8* %call to i32*, !dbg !91
  store i32* %0, i32** %data, align 8, !dbg !92
  %1 = load i32*, i32** %data, align 8, !dbg !93
  %cmp = icmp eq i32* %1, null, !dbg !95
  br i1 %cmp, label %if.then, label %if.end, !dbg !96

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !97
  unreachable, !dbg !97

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !99
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !100
  %3 = load i32*, i32** %data, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !101
  store i32 0, i32* %arrayidx, align 4, !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !103, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !106
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !107
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !108
  store i32 0, i32* %arrayidx3, align 4, !dbg !109
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !110
  %4 = bitcast i32* %arraydecay4 to i8*, !dbg !110
  %5 = load i32*, i32** %data, align 8, !dbg !111
  %6 = bitcast i32* %5 to i8*, !dbg !110
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !112
  %call6 = call i64 @wcslen(i32* %arraydecay5) #9, !dbg !113
  %mul = mul i64 %call6, 4, !dbg !114
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %4, i8* align 4 %6, i64 %mul, i1 false), !dbg !110
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !115
  store i32 0, i32* %arrayidx7, align 4, !dbg !116
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !117
  call void @printWLine(i32* %arraydecay8), !dbg !118
  %7 = load i32*, i32** %data, align 8, !dbg !119
  %8 = bitcast i32* %7 to i8*, !dbg !119
  call void @free(i8* %8) #7, !dbg !120
  ret void, !dbg !121
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !122 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !123, metadata !DIExpression()), !dbg !124
  store i32* null, i32** %data, align 8, !dbg !125
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !126
  %0 = bitcast i8* %call to i32*, !dbg !129
  store i32* %0, i32** %data, align 8, !dbg !130
  %1 = load i32*, i32** %data, align 8, !dbg !131
  %cmp = icmp eq i32* %1, null, !dbg !133
  br i1 %cmp, label %if.then, label %if.end, !dbg !134

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !135
  unreachable, !dbg !135

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !137
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !138
  %3 = load i32*, i32** %data, align 8, !dbg !139
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !139
  store i32 0, i32* %arrayidx, align 4, !dbg !140
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !141, metadata !DIExpression()), !dbg !143
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !144
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !145
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !146
  store i32 0, i32* %arrayidx3, align 4, !dbg !147
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !148
  %4 = bitcast i32* %arraydecay4 to i8*, !dbg !148
  %5 = load i32*, i32** %data, align 8, !dbg !149
  %6 = bitcast i32* %5 to i8*, !dbg !148
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !150
  %call6 = call i64 @wcslen(i32* %arraydecay5) #9, !dbg !151
  %mul = mul i64 %call6, 4, !dbg !152
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %4, i8* align 4 %6, i64 %mul, i1 false), !dbg !148
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !153
  store i32 0, i32* %arrayidx7, align 4, !dbg !154
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !155
  call void @printWLine(i32* %arraydecay8), !dbg !156
  %7 = load i32*, i32** %data, align 8, !dbg !157
  %8 = bitcast i32* %7 to i8*, !dbg !157
  call void @free(i8* %8) #7, !dbg !158
  ret void, !dbg !159
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_04.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_04_bad", scope: !17, file: !17, line: 30, type: !18, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_04.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 32, type: !4)
!21 = !DILocation(line: 32, column: 15, scope: !16)
!22 = !DILocation(line: 33, column: 10, scope: !16)
!23 = !DILocation(line: 37, column: 27, scope: !24)
!24 = distinct !DILexicalBlock(scope: !25, file: !17, line: 35, column: 5)
!25 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 8)
!26 = !DILocation(line: 37, column: 16, scope: !24)
!27 = !DILocation(line: 37, column: 14, scope: !24)
!28 = !DILocation(line: 38, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !24, file: !17, line: 38, column: 13)
!30 = !DILocation(line: 38, column: 18, scope: !29)
!31 = !DILocation(line: 38, column: 13, scope: !24)
!32 = !DILocation(line: 38, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !17, line: 38, column: 27)
!34 = !DILocation(line: 39, column: 17, scope: !24)
!35 = !DILocation(line: 39, column: 9, scope: !24)
!36 = !DILocation(line: 40, column: 9, scope: !24)
!37 = !DILocation(line: 40, column: 20, scope: !24)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !17, line: 43, type: !40)
!39 = distinct !DILexicalBlock(scope: !16, file: !17, line: 42, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 43, column: 17, scope: !39)
!44 = !DILocation(line: 44, column: 17, scope: !39)
!45 = !DILocation(line: 44, column: 9, scope: !39)
!46 = !DILocation(line: 45, column: 9, scope: !39)
!47 = !DILocation(line: 45, column: 21, scope: !39)
!48 = !DILocation(line: 48, column: 9, scope: !39)
!49 = !DILocation(line: 48, column: 23, scope: !39)
!50 = !DILocation(line: 48, column: 36, scope: !39)
!51 = !DILocation(line: 48, column: 29, scope: !39)
!52 = !DILocation(line: 48, column: 41, scope: !39)
!53 = !DILocation(line: 49, column: 9, scope: !39)
!54 = !DILocation(line: 49, column: 21, scope: !39)
!55 = !DILocation(line: 50, column: 20, scope: !39)
!56 = !DILocation(line: 50, column: 9, scope: !39)
!57 = !DILocation(line: 51, column: 14, scope: !39)
!58 = !DILocation(line: 51, column: 9, scope: !39)
!59 = !DILocation(line: 53, column: 1, scope: !16)
!60 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_04_good", scope: !17, file: !17, line: 116, type: !18, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 118, column: 5, scope: !60)
!62 = !DILocation(line: 119, column: 5, scope: !60)
!63 = !DILocation(line: 120, column: 1, scope: !60)
!64 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 132, type: !65, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!7, !7, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !17, line: 132, type: !7)
!71 = !DILocation(line: 132, column: 14, scope: !64)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !17, line: 132, type: !67)
!73 = !DILocation(line: 132, column: 27, scope: !64)
!74 = !DILocation(line: 135, column: 22, scope: !64)
!75 = !DILocation(line: 135, column: 12, scope: !64)
!76 = !DILocation(line: 135, column: 5, scope: !64)
!77 = !DILocation(line: 137, column: 5, scope: !64)
!78 = !DILocation(line: 138, column: 5, scope: !64)
!79 = !DILocation(line: 139, column: 5, scope: !64)
!80 = !DILocation(line: 142, column: 5, scope: !64)
!81 = !DILocation(line: 143, column: 5, scope: !64)
!82 = !DILocation(line: 144, column: 5, scope: !64)
!83 = !DILocation(line: 146, column: 5, scope: !64)
!84 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 60, type: !18, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !17, line: 62, type: !4)
!86 = !DILocation(line: 62, column: 15, scope: !84)
!87 = !DILocation(line: 63, column: 10, scope: !84)
!88 = !DILocation(line: 72, column: 27, scope: !89)
!89 = distinct !DILexicalBlock(scope: !90, file: !17, line: 70, column: 5)
!90 = distinct !DILexicalBlock(scope: !84, file: !17, line: 64, column: 8)
!91 = !DILocation(line: 72, column: 16, scope: !89)
!92 = !DILocation(line: 72, column: 14, scope: !89)
!93 = !DILocation(line: 73, column: 13, scope: !94)
!94 = distinct !DILexicalBlock(scope: !89, file: !17, line: 73, column: 13)
!95 = !DILocation(line: 73, column: 18, scope: !94)
!96 = !DILocation(line: 73, column: 13, scope: !89)
!97 = !DILocation(line: 73, column: 28, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !17, line: 73, column: 27)
!99 = !DILocation(line: 74, column: 17, scope: !89)
!100 = !DILocation(line: 74, column: 9, scope: !89)
!101 = !DILocation(line: 75, column: 9, scope: !89)
!102 = !DILocation(line: 75, column: 21, scope: !89)
!103 = !DILocalVariable(name: "dest", scope: !104, file: !17, line: 78, type: !40)
!104 = distinct !DILexicalBlock(scope: !84, file: !17, line: 77, column: 5)
!105 = !DILocation(line: 78, column: 17, scope: !104)
!106 = !DILocation(line: 79, column: 17, scope: !104)
!107 = !DILocation(line: 79, column: 9, scope: !104)
!108 = !DILocation(line: 80, column: 9, scope: !104)
!109 = !DILocation(line: 80, column: 21, scope: !104)
!110 = !DILocation(line: 83, column: 9, scope: !104)
!111 = !DILocation(line: 83, column: 23, scope: !104)
!112 = !DILocation(line: 83, column: 36, scope: !104)
!113 = !DILocation(line: 83, column: 29, scope: !104)
!114 = !DILocation(line: 83, column: 41, scope: !104)
!115 = !DILocation(line: 84, column: 9, scope: !104)
!116 = !DILocation(line: 84, column: 21, scope: !104)
!117 = !DILocation(line: 85, column: 20, scope: !104)
!118 = !DILocation(line: 85, column: 9, scope: !104)
!119 = !DILocation(line: 86, column: 14, scope: !104)
!120 = !DILocation(line: 86, column: 9, scope: !104)
!121 = !DILocation(line: 88, column: 1, scope: !84)
!122 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 91, type: !18, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!123 = !DILocalVariable(name: "data", scope: !122, file: !17, line: 93, type: !4)
!124 = !DILocation(line: 93, column: 15, scope: !122)
!125 = !DILocation(line: 94, column: 10, scope: !122)
!126 = !DILocation(line: 98, column: 27, scope: !127)
!127 = distinct !DILexicalBlock(scope: !128, file: !17, line: 96, column: 5)
!128 = distinct !DILexicalBlock(scope: !122, file: !17, line: 95, column: 8)
!129 = !DILocation(line: 98, column: 16, scope: !127)
!130 = !DILocation(line: 98, column: 14, scope: !127)
!131 = !DILocation(line: 99, column: 13, scope: !132)
!132 = distinct !DILexicalBlock(scope: !127, file: !17, line: 99, column: 13)
!133 = !DILocation(line: 99, column: 18, scope: !132)
!134 = !DILocation(line: 99, column: 13, scope: !127)
!135 = !DILocation(line: 99, column: 28, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !17, line: 99, column: 27)
!137 = !DILocation(line: 100, column: 17, scope: !127)
!138 = !DILocation(line: 100, column: 9, scope: !127)
!139 = !DILocation(line: 101, column: 9, scope: !127)
!140 = !DILocation(line: 101, column: 21, scope: !127)
!141 = !DILocalVariable(name: "dest", scope: !142, file: !17, line: 104, type: !40)
!142 = distinct !DILexicalBlock(scope: !122, file: !17, line: 103, column: 5)
!143 = !DILocation(line: 104, column: 17, scope: !142)
!144 = !DILocation(line: 105, column: 17, scope: !142)
!145 = !DILocation(line: 105, column: 9, scope: !142)
!146 = !DILocation(line: 106, column: 9, scope: !142)
!147 = !DILocation(line: 106, column: 21, scope: !142)
!148 = !DILocation(line: 109, column: 9, scope: !142)
!149 = !DILocation(line: 109, column: 23, scope: !142)
!150 = !DILocation(line: 109, column: 36, scope: !142)
!151 = !DILocation(line: 109, column: 29, scope: !142)
!152 = !DILocation(line: 109, column: 41, scope: !142)
!153 = !DILocation(line: 110, column: 9, scope: !142)
!154 = !DILocation(line: 110, column: 21, scope: !142)
!155 = !DILocation(line: 111, column: 20, scope: !142)
!156 = !DILocation(line: 111, column: 9, scope: !142)
!157 = !DILocation(line: 112, column: 14, scope: !142)
!158 = !DILocation(line: 112, column: 9, scope: !142)
!159 = !DILocation(line: 114, column: 1, scope: !122)
