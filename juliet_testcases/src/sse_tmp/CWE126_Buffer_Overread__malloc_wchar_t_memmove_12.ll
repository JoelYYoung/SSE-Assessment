; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_12.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_12_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !23
  %tobool = icmp ne i32 %call, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.else, !dbg !25

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !26
  %0 = bitcast i8* %call1 to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then2, label %if.end, !dbg !33

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %data, align 8, !dbg !36
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !37
  %3 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  br label %if.end10, !dbg !40

if.else:                                          ; preds = %entry
  %call4 = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !41
  %4 = bitcast i8* %call4 to i32*, !dbg !43
  store i32* %4, i32** %data, align 8, !dbg !44
  %5 = load i32*, i32** %data, align 8, !dbg !45
  %cmp5 = icmp eq i32* %5, null, !dbg !47
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !48

if.then6:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !49
  unreachable, !dbg !49

if.end7:                                          ; preds = %if.else
  %6 = load i32*, i32** %data, align 8, !dbg !51
  %call8 = call i32* @wmemset(i32* %6, i32 65, i64 99) #7, !dbg !52
  %7 = load i32*, i32** %data, align 8, !dbg !53
  %arrayidx9 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !53
  store i32 0, i32* %arrayidx9, align 4, !dbg !54
  br label %if.end10

if.end10:                                         ; preds = %if.end7, %if.end
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !55, metadata !DIExpression()), !dbg !60
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !61
  %call11 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !62
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !63
  store i32 0, i32* %arrayidx12, align 4, !dbg !64
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !65
  %8 = bitcast i32* %arraydecay13 to i8*, !dbg !65
  %9 = load i32*, i32** %data, align 8, !dbg !66
  %10 = bitcast i32* %9 to i8*, !dbg !65
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !67
  %call15 = call i64 @wcslen(i32* %arraydecay14) #9, !dbg !68
  %mul = mul i64 %call15, 4, !dbg !69
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %8, i8* align 4 %10, i64 %mul, i1 false), !dbg !65
  %arrayidx16 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !70
  store i32 0, i32* %arrayidx16, align 4, !dbg !71
  %arraydecay17 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !72
  call void @printWLine(i32* %arraydecay17), !dbg !73
  %11 = load i32*, i32** %data, align 8, !dbg !74
  %12 = bitcast i32* %11 to i8*, !dbg !74
  call void @free(i8* %12) #7, !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printWLine(i32*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_12_good() #0 !dbg !77 {
entry:
  call void @goodG2B(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* null) #7, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #7, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_12_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_12_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !100 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !101, metadata !DIExpression()), !dbg !102
  store i32* null, i32** %data, align 8, !dbg !103
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !104
  %tobool = icmp ne i32 %call, 0, !dbg !104
  br i1 %tobool, label %if.then, label %if.else, !dbg !106

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !107
  %0 = bitcast i8* %call1 to i32*, !dbg !109
  store i32* %0, i32** %data, align 8, !dbg !110
  %1 = load i32*, i32** %data, align 8, !dbg !111
  %cmp = icmp eq i32* %1, null, !dbg !113
  br i1 %cmp, label %if.then2, label %if.end, !dbg !114

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !115
  unreachable, !dbg !115

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %data, align 8, !dbg !117
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !118
  %3 = load i32*, i32** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !119
  store i32 0, i32* %arrayidx, align 4, !dbg !120
  br label %if.end10, !dbg !121

if.else:                                          ; preds = %entry
  %call4 = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !122
  %4 = bitcast i8* %call4 to i32*, !dbg !124
  store i32* %4, i32** %data, align 8, !dbg !125
  %5 = load i32*, i32** %data, align 8, !dbg !126
  %cmp5 = icmp eq i32* %5, null, !dbg !128
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !129

if.then6:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !130
  unreachable, !dbg !130

if.end7:                                          ; preds = %if.else
  %6 = load i32*, i32** %data, align 8, !dbg !132
  %call8 = call i32* @wmemset(i32* %6, i32 65, i64 99) #7, !dbg !133
  %7 = load i32*, i32** %data, align 8, !dbg !134
  %arrayidx9 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !134
  store i32 0, i32* %arrayidx9, align 4, !dbg !135
  br label %if.end10

if.end10:                                         ; preds = %if.end7, %if.end
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !136, metadata !DIExpression()), !dbg !138
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !139
  %call11 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !140
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !141
  store i32 0, i32* %arrayidx12, align 4, !dbg !142
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !143
  %8 = bitcast i32* %arraydecay13 to i8*, !dbg !143
  %9 = load i32*, i32** %data, align 8, !dbg !144
  %10 = bitcast i32* %9 to i8*, !dbg !143
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !145
  %call15 = call i64 @wcslen(i32* %arraydecay14) #9, !dbg !146
  %mul = mul i64 %call15, 4, !dbg !147
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %8, i8* align 4 %10, i64 %mul, i1 false), !dbg !143
  %arrayidx16 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !148
  store i32 0, i32* %arrayidx16, align 4, !dbg !149
  %arraydecay17 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !150
  call void @printWLine(i32* %arraydecay17), !dbg !151
  %11 = load i32*, i32** %data, align 8, !dbg !152
  %12 = bitcast i32* %11 to i8*, !dbg !152
  call void @free(i8* %12) #7, !dbg !153
  ret void, !dbg !154
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_12.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_12_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_12.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 8)
!25 = !DILocation(line: 27, column: 8, scope: !16)
!26 = !DILocation(line: 30, column: 27, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !17, line: 28, column: 5)
!28 = !DILocation(line: 30, column: 16, scope: !27)
!29 = !DILocation(line: 30, column: 14, scope: !27)
!30 = !DILocation(line: 31, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 31, column: 13)
!32 = !DILocation(line: 31, column: 18, scope: !31)
!33 = !DILocation(line: 31, column: 13, scope: !27)
!34 = !DILocation(line: 31, column: 28, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 31, column: 27)
!36 = !DILocation(line: 32, column: 17, scope: !27)
!37 = !DILocation(line: 32, column: 9, scope: !27)
!38 = !DILocation(line: 33, column: 9, scope: !27)
!39 = !DILocation(line: 33, column: 20, scope: !27)
!40 = !DILocation(line: 34, column: 5, scope: !27)
!41 = !DILocation(line: 38, column: 27, scope: !42)
!42 = distinct !DILexicalBlock(scope: !24, file: !17, line: 36, column: 5)
!43 = !DILocation(line: 38, column: 16, scope: !42)
!44 = !DILocation(line: 38, column: 14, scope: !42)
!45 = !DILocation(line: 39, column: 13, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !17, line: 39, column: 13)
!47 = !DILocation(line: 39, column: 18, scope: !46)
!48 = !DILocation(line: 39, column: 13, scope: !42)
!49 = !DILocation(line: 39, column: 28, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !17, line: 39, column: 27)
!51 = !DILocation(line: 40, column: 17, scope: !42)
!52 = !DILocation(line: 40, column: 9, scope: !42)
!53 = !DILocation(line: 41, column: 9, scope: !42)
!54 = !DILocation(line: 41, column: 21, scope: !42)
!55 = !DILocalVariable(name: "dest", scope: !56, file: !17, line: 44, type: !57)
!56 = distinct !DILexicalBlock(scope: !16, file: !17, line: 43, column: 5)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !58)
!58 = !{!59}
!59 = !DISubrange(count: 100)
!60 = !DILocation(line: 44, column: 17, scope: !56)
!61 = !DILocation(line: 45, column: 17, scope: !56)
!62 = !DILocation(line: 45, column: 9, scope: !56)
!63 = !DILocation(line: 46, column: 9, scope: !56)
!64 = !DILocation(line: 46, column: 21, scope: !56)
!65 = !DILocation(line: 49, column: 9, scope: !56)
!66 = !DILocation(line: 49, column: 23, scope: !56)
!67 = !DILocation(line: 49, column: 36, scope: !56)
!68 = !DILocation(line: 49, column: 29, scope: !56)
!69 = !DILocation(line: 49, column: 41, scope: !56)
!70 = !DILocation(line: 50, column: 9, scope: !56)
!71 = !DILocation(line: 50, column: 21, scope: !56)
!72 = !DILocation(line: 51, column: 20, scope: !56)
!73 = !DILocation(line: 51, column: 9, scope: !56)
!74 = !DILocation(line: 52, column: 14, scope: !56)
!75 = !DILocation(line: 52, column: 9, scope: !56)
!76 = !DILocation(line: 54, column: 1, scope: !16)
!77 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_12_good", scope: !17, file: !17, line: 95, type: !18, scopeLine: 96, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocation(line: 97, column: 5, scope: !77)
!79 = !DILocation(line: 98, column: 1, scope: !77)
!80 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 110, type: !81, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!7, !7, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !17, line: 110, type: !7)
!87 = !DILocation(line: 110, column: 14, scope: !80)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !17, line: 110, type: !83)
!89 = !DILocation(line: 110, column: 27, scope: !80)
!90 = !DILocation(line: 113, column: 22, scope: !80)
!91 = !DILocation(line: 113, column: 12, scope: !80)
!92 = !DILocation(line: 113, column: 5, scope: !80)
!93 = !DILocation(line: 115, column: 5, scope: !80)
!94 = !DILocation(line: 116, column: 5, scope: !80)
!95 = !DILocation(line: 117, column: 5, scope: !80)
!96 = !DILocation(line: 120, column: 5, scope: !80)
!97 = !DILocation(line: 121, column: 5, scope: !80)
!98 = !DILocation(line: 122, column: 5, scope: !80)
!99 = !DILocation(line: 124, column: 5, scope: !80)
!100 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 62, type: !18, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !17, line: 64, type: !4)
!102 = !DILocation(line: 64, column: 15, scope: !100)
!103 = !DILocation(line: 65, column: 10, scope: !100)
!104 = !DILocation(line: 66, column: 8, scope: !105)
!105 = distinct !DILexicalBlock(scope: !100, file: !17, line: 66, column: 8)
!106 = !DILocation(line: 66, column: 8, scope: !100)
!107 = !DILocation(line: 69, column: 27, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !17, line: 67, column: 5)
!109 = !DILocation(line: 69, column: 16, scope: !108)
!110 = !DILocation(line: 69, column: 14, scope: !108)
!111 = !DILocation(line: 70, column: 13, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !17, line: 70, column: 13)
!113 = !DILocation(line: 70, column: 18, scope: !112)
!114 = !DILocation(line: 70, column: 13, scope: !108)
!115 = !DILocation(line: 70, column: 28, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !17, line: 70, column: 27)
!117 = !DILocation(line: 71, column: 17, scope: !108)
!118 = !DILocation(line: 71, column: 9, scope: !108)
!119 = !DILocation(line: 72, column: 9, scope: !108)
!120 = !DILocation(line: 72, column: 21, scope: !108)
!121 = !DILocation(line: 73, column: 5, scope: !108)
!122 = !DILocation(line: 77, column: 27, scope: !123)
!123 = distinct !DILexicalBlock(scope: !105, file: !17, line: 75, column: 5)
!124 = !DILocation(line: 77, column: 16, scope: !123)
!125 = !DILocation(line: 77, column: 14, scope: !123)
!126 = !DILocation(line: 78, column: 13, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !17, line: 78, column: 13)
!128 = !DILocation(line: 78, column: 18, scope: !127)
!129 = !DILocation(line: 78, column: 13, scope: !123)
!130 = !DILocation(line: 78, column: 28, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !17, line: 78, column: 27)
!132 = !DILocation(line: 79, column: 17, scope: !123)
!133 = !DILocation(line: 79, column: 9, scope: !123)
!134 = !DILocation(line: 80, column: 9, scope: !123)
!135 = !DILocation(line: 80, column: 21, scope: !123)
!136 = !DILocalVariable(name: "dest", scope: !137, file: !17, line: 83, type: !57)
!137 = distinct !DILexicalBlock(scope: !100, file: !17, line: 82, column: 5)
!138 = !DILocation(line: 83, column: 17, scope: !137)
!139 = !DILocation(line: 84, column: 17, scope: !137)
!140 = !DILocation(line: 84, column: 9, scope: !137)
!141 = !DILocation(line: 85, column: 9, scope: !137)
!142 = !DILocation(line: 85, column: 21, scope: !137)
!143 = !DILocation(line: 88, column: 9, scope: !137)
!144 = !DILocation(line: 88, column: 23, scope: !137)
!145 = !DILocation(line: 88, column: 36, scope: !137)
!146 = !DILocation(line: 88, column: 29, scope: !137)
!147 = !DILocation(line: 88, column: 41, scope: !137)
!148 = !DILocation(line: 89, column: 9, scope: !137)
!149 = !DILocation(line: 89, column: 21, scope: !137)
!150 = !DILocation(line: 90, column: 20, scope: !137)
!151 = !DILocation(line: 90, column: 9, scope: !137)
!152 = !DILocation(line: 91, column: 14, scope: !137)
!153 = !DILocation(line: 91, column: 9, scope: !137)
!154 = !DILocation(line: 93, column: 1, scope: !100)
