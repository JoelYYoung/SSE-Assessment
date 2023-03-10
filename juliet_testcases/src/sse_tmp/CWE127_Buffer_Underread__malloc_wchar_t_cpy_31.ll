; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_31.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_31_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !27
  store i32* %0, i32** %dataBuffer, align 8, !dbg !25
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !34
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !35
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !39
  store i32* %add.ptr, i32** %data, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !41, metadata !DIExpression()), !dbg !43
  %5 = load i32*, i32** %data, align 8, !dbg !44
  store i32* %5, i32** %dataCopy, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !45, metadata !DIExpression()), !dbg !46
  %6 = load i32*, i32** %dataCopy, align 8, !dbg !47
  store i32* %6, i32** %data2, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !48, metadata !DIExpression()), !dbg !53
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !54
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #5, !dbg !55
  %arrayidx4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !56
  store i32 0, i32* %arrayidx4, align 4, !dbg !57
  %arraydecay5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !58
  %7 = load i32*, i32** %data2, align 8, !dbg !59
  %call6 = call i32* @wcscpy(i32* %arraydecay5, i32* %7) #5, !dbg !60
  %arraydecay7 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !61
  call void @printWLine(i32* %arraydecay7), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_31_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #5, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #5, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_31_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_31_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !87 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i32* null, i32** %data, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !91, metadata !DIExpression()), !dbg !93
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !94
  %0 = bitcast i8* %call to i32*, !dbg !95
  store i32* %0, i32** %dataBuffer, align 8, !dbg !93
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !96
  %cmp = icmp eq i32* %1, null, !dbg !98
  br i1 %cmp, label %if.then, label %if.end, !dbg !99

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !100
  unreachable, !dbg !100

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !102
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !103
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !104
  store i32 0, i32* %arrayidx, align 4, !dbg !105
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !106
  store i32* %4, i32** %data, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !108, metadata !DIExpression()), !dbg !110
  %5 = load i32*, i32** %data, align 8, !dbg !111
  store i32* %5, i32** %dataCopy, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !112, metadata !DIExpression()), !dbg !113
  %6 = load i32*, i32** %dataCopy, align 8, !dbg !114
  store i32* %6, i32** %data2, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !115, metadata !DIExpression()), !dbg !117
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !118
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #5, !dbg !119
  %arrayidx4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !120
  store i32 0, i32* %arrayidx4, align 4, !dbg !121
  %arraydecay5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !122
  %7 = load i32*, i32** %data2, align 8, !dbg !123
  %call6 = call i32* @wcscpy(i32* %arraydecay5, i32* %7) #5, !dbg !124
  %arraydecay7 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !125
  call void @printWLine(i32* %arraydecay7), !dbg !126
  ret void, !dbg !127
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_cpy_31_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_31.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocalVariable(name: "dataBuffer", scope: !24, file: !17, line: 28, type: !4)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 5)
!25 = !DILocation(line: 28, column: 19, scope: !24)
!26 = !DILocation(line: 28, column: 43, scope: !24)
!27 = !DILocation(line: 28, column: 32, scope: !24)
!28 = !DILocation(line: 29, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !24, file: !17, line: 29, column: 13)
!30 = !DILocation(line: 29, column: 24, scope: !29)
!31 = !DILocation(line: 29, column: 13, scope: !24)
!32 = !DILocation(line: 29, column: 34, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !17, line: 29, column: 33)
!34 = !DILocation(line: 30, column: 17, scope: !24)
!35 = !DILocation(line: 30, column: 9, scope: !24)
!36 = !DILocation(line: 31, column: 9, scope: !24)
!37 = !DILocation(line: 31, column: 27, scope: !24)
!38 = !DILocation(line: 33, column: 16, scope: !24)
!39 = !DILocation(line: 33, column: 27, scope: !24)
!40 = !DILocation(line: 33, column: 14, scope: !24)
!41 = !DILocalVariable(name: "dataCopy", scope: !42, file: !17, line: 36, type: !4)
!42 = distinct !DILexicalBlock(scope: !16, file: !17, line: 35, column: 5)
!43 = !DILocation(line: 36, column: 19, scope: !42)
!44 = !DILocation(line: 36, column: 30, scope: !42)
!45 = !DILocalVariable(name: "data", scope: !42, file: !17, line: 37, type: !4)
!46 = !DILocation(line: 37, column: 19, scope: !42)
!47 = !DILocation(line: 37, column: 26, scope: !42)
!48 = !DILocalVariable(name: "dest", scope: !49, file: !17, line: 39, type: !50)
!49 = distinct !DILexicalBlock(scope: !42, file: !17, line: 38, column: 9)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 200)
!53 = !DILocation(line: 39, column: 21, scope: !49)
!54 = !DILocation(line: 40, column: 21, scope: !49)
!55 = !DILocation(line: 40, column: 13, scope: !49)
!56 = !DILocation(line: 41, column: 13, scope: !49)
!57 = !DILocation(line: 41, column: 27, scope: !49)
!58 = !DILocation(line: 43, column: 20, scope: !49)
!59 = !DILocation(line: 43, column: 26, scope: !49)
!60 = !DILocation(line: 43, column: 13, scope: !49)
!61 = !DILocation(line: 44, column: 24, scope: !49)
!62 = !DILocation(line: 44, column: 13, scope: !49)
!63 = !DILocation(line: 49, column: 1, scope: !16)
!64 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_cpy_31_good", scope: !17, file: !17, line: 84, type: !18, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 86, column: 5, scope: !64)
!66 = !DILocation(line: 87, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 98, type: !68, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!7, !7, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !17, line: 98, type: !7)
!74 = !DILocation(line: 98, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !17, line: 98, type: !70)
!76 = !DILocation(line: 98, column: 27, scope: !67)
!77 = !DILocation(line: 101, column: 22, scope: !67)
!78 = !DILocation(line: 101, column: 12, scope: !67)
!79 = !DILocation(line: 101, column: 5, scope: !67)
!80 = !DILocation(line: 103, column: 5, scope: !67)
!81 = !DILocation(line: 104, column: 5, scope: !67)
!82 = !DILocation(line: 105, column: 5, scope: !67)
!83 = !DILocation(line: 108, column: 5, scope: !67)
!84 = !DILocation(line: 109, column: 5, scope: !67)
!85 = !DILocation(line: 110, column: 5, scope: !67)
!86 = !DILocation(line: 112, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 56, type: !18, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !17, line: 58, type: !4)
!89 = !DILocation(line: 58, column: 15, scope: !87)
!90 = !DILocation(line: 59, column: 10, scope: !87)
!91 = !DILocalVariable(name: "dataBuffer", scope: !92, file: !17, line: 61, type: !4)
!92 = distinct !DILexicalBlock(scope: !87, file: !17, line: 60, column: 5)
!93 = !DILocation(line: 61, column: 19, scope: !92)
!94 = !DILocation(line: 61, column: 43, scope: !92)
!95 = !DILocation(line: 61, column: 32, scope: !92)
!96 = !DILocation(line: 62, column: 13, scope: !97)
!97 = distinct !DILexicalBlock(scope: !92, file: !17, line: 62, column: 13)
!98 = !DILocation(line: 62, column: 24, scope: !97)
!99 = !DILocation(line: 62, column: 13, scope: !92)
!100 = !DILocation(line: 62, column: 34, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !17, line: 62, column: 33)
!102 = !DILocation(line: 63, column: 17, scope: !92)
!103 = !DILocation(line: 63, column: 9, scope: !92)
!104 = !DILocation(line: 64, column: 9, scope: !92)
!105 = !DILocation(line: 64, column: 27, scope: !92)
!106 = !DILocation(line: 66, column: 16, scope: !92)
!107 = !DILocation(line: 66, column: 14, scope: !92)
!108 = !DILocalVariable(name: "dataCopy", scope: !109, file: !17, line: 69, type: !4)
!109 = distinct !DILexicalBlock(scope: !87, file: !17, line: 68, column: 5)
!110 = !DILocation(line: 69, column: 19, scope: !109)
!111 = !DILocation(line: 69, column: 30, scope: !109)
!112 = !DILocalVariable(name: "data", scope: !109, file: !17, line: 70, type: !4)
!113 = !DILocation(line: 70, column: 19, scope: !109)
!114 = !DILocation(line: 70, column: 26, scope: !109)
!115 = !DILocalVariable(name: "dest", scope: !116, file: !17, line: 72, type: !50)
!116 = distinct !DILexicalBlock(scope: !109, file: !17, line: 71, column: 9)
!117 = !DILocation(line: 72, column: 21, scope: !116)
!118 = !DILocation(line: 73, column: 21, scope: !116)
!119 = !DILocation(line: 73, column: 13, scope: !116)
!120 = !DILocation(line: 74, column: 13, scope: !116)
!121 = !DILocation(line: 74, column: 27, scope: !116)
!122 = !DILocation(line: 76, column: 20, scope: !116)
!123 = !DILocation(line: 76, column: 26, scope: !116)
!124 = !DILocation(line: 76, column: 13, scope: !116)
!125 = !DILocation(line: 77, column: 24, scope: !116)
!126 = !DILocation(line: 77, column: 13, scope: !116)
!127 = !DILocation(line: 82, column: 1, scope: !87)
