; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_15_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 200, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 400, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !29
  store i32* %4, i32** %data, align 8, !dbg !30
  %5 = load i32*, i32** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !33, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !39
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !40
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !41
  store i32 0, i32* %arrayidx1, align 4, !dbg !42
  %6 = load i32*, i32** %data, align 8, !dbg !43
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !44
  %call3 = call i32* @wcscat(i32* %6, i32* %arraydecay2) #4, !dbg !45
  %7 = load i32*, i32** %data, align 8, !dbg !46
  call void @printWLine(i32* %7), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_15_good() #0 !dbg !49 {
entry:
  call void @goodG2B1(), !dbg !50
  call void @goodG2B2(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #4, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #4, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_15_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_15_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = alloca i8, i64 200, align 16, !dbg !78
  %1 = bitcast i8* %0 to i32*, !dbg !79
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !77
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %2 = alloca i8, i64 400, align 16, !dbg !82
  %3 = bitcast i8* %2 to i32*, !dbg !83
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !81
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !84
  store i32* %4, i32** %data, align 8, !dbg !85
  %5 = load i32*, i32** %data, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !86
  store i32 0, i32* %arrayidx, align 4, !dbg !87
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !88, metadata !DIExpression()), !dbg !90
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !91
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !92
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !93
  store i32 0, i32* %arrayidx1, align 4, !dbg !94
  %6 = load i32*, i32** %data, align 8, !dbg !95
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !96
  %call3 = call i32* @wcscat(i32* %6, i32* %arraydecay2) #4, !dbg !97
  %7 = load i32*, i32** %data, align 8, !dbg !98
  call void @printWLine(i32* %7), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !101 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = alloca i8, i64 200, align 16, !dbg !106
  %1 = bitcast i8* %0 to i32*, !dbg !107
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %2 = alloca i8, i64 400, align 16, !dbg !110
  %3 = bitcast i8* %2 to i32*, !dbg !111
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !109
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !112
  store i32* %4, i32** %data, align 8, !dbg !113
  %5 = load i32*, i32** %data, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !114
  store i32 0, i32* %arrayidx, align 4, !dbg !115
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !116, metadata !DIExpression()), !dbg !118
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !119
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !120
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !121
  store i32 0, i32* %arrayidx1, align 4, !dbg !122
  %6 = load i32*, i32** %data, align 8, !dbg !123
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !124
  %call3 = call i32* @wcscat(i32* %6, i32* %arraydecay2) #4, !dbg !125
  %7 = load i32*, i32** %data, align 8, !dbg !126
  call void @printWLine(i32* %7), !dbg !127
  ret void, !dbg !128
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_15_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_15.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 42, scope: !15)
!24 = !DILocation(line: 26, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 27, type: !4)
!26 = !DILocation(line: 27, column: 15, scope: !15)
!27 = !DILocation(line: 27, column: 43, scope: !15)
!28 = !DILocation(line: 27, column: 32, scope: !15)
!29 = !DILocation(line: 33, column: 16, scope: !15)
!30 = !DILocation(line: 33, column: 14, scope: !15)
!31 = !DILocation(line: 34, column: 9, scope: !15)
!32 = !DILocation(line: 34, column: 17, scope: !15)
!33 = !DILocalVariable(name: "source", scope: !34, file: !16, line: 42, type: !35)
!34 = distinct !DILexicalBlock(scope: !15, file: !16, line: 41, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 42, column: 17, scope: !34)
!39 = !DILocation(line: 43, column: 17, scope: !34)
!40 = !DILocation(line: 43, column: 9, scope: !34)
!41 = !DILocation(line: 44, column: 9, scope: !34)
!42 = !DILocation(line: 44, column: 23, scope: !34)
!43 = !DILocation(line: 46, column: 16, scope: !34)
!44 = !DILocation(line: 46, column: 22, scope: !34)
!45 = !DILocation(line: 46, column: 9, scope: !34)
!46 = !DILocation(line: 47, column: 20, scope: !34)
!47 = !DILocation(line: 47, column: 9, scope: !34)
!48 = !DILocation(line: 49, column: 1, scope: !15)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_15_good", scope: !16, file: !16, line: 111, type: !17, scopeLine: 112, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 113, column: 5, scope: !49)
!51 = !DILocation(line: 114, column: 5, scope: !49)
!52 = !DILocation(line: 115, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 127, type: !54, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!7, !7, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !16, line: 127, type: !7)
!60 = !DILocation(line: 127, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !16, line: 127, type: !56)
!62 = !DILocation(line: 127, column: 27, scope: !53)
!63 = !DILocation(line: 130, column: 22, scope: !53)
!64 = !DILocation(line: 130, column: 12, scope: !53)
!65 = !DILocation(line: 130, column: 5, scope: !53)
!66 = !DILocation(line: 132, column: 5, scope: !53)
!67 = !DILocation(line: 133, column: 5, scope: !53)
!68 = !DILocation(line: 134, column: 5, scope: !53)
!69 = !DILocation(line: 137, column: 5, scope: !53)
!70 = !DILocation(line: 138, column: 5, scope: !53)
!71 = !DILocation(line: 139, column: 5, scope: !53)
!72 = !DILocation(line: 141, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 56, type: !17, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !16, line: 58, type: !4)
!75 = !DILocation(line: 58, column: 15, scope: !73)
!76 = !DILocalVariable(name: "dataBadBuffer", scope: !73, file: !16, line: 59, type: !4)
!77 = !DILocation(line: 59, column: 15, scope: !73)
!78 = !DILocation(line: 59, column: 42, scope: !73)
!79 = !DILocation(line: 59, column: 31, scope: !73)
!80 = !DILocalVariable(name: "dataGoodBuffer", scope: !73, file: !16, line: 60, type: !4)
!81 = !DILocation(line: 60, column: 15, scope: !73)
!82 = !DILocation(line: 60, column: 43, scope: !73)
!83 = !DILocation(line: 60, column: 32, scope: !73)
!84 = !DILocation(line: 69, column: 16, scope: !73)
!85 = !DILocation(line: 69, column: 14, scope: !73)
!86 = !DILocation(line: 70, column: 9, scope: !73)
!87 = !DILocation(line: 70, column: 17, scope: !73)
!88 = !DILocalVariable(name: "source", scope: !89, file: !16, line: 74, type: !35)
!89 = distinct !DILexicalBlock(scope: !73, file: !16, line: 73, column: 5)
!90 = !DILocation(line: 74, column: 17, scope: !89)
!91 = !DILocation(line: 75, column: 17, scope: !89)
!92 = !DILocation(line: 75, column: 9, scope: !89)
!93 = !DILocation(line: 76, column: 9, scope: !89)
!94 = !DILocation(line: 76, column: 23, scope: !89)
!95 = !DILocation(line: 78, column: 16, scope: !89)
!96 = !DILocation(line: 78, column: 22, scope: !89)
!97 = !DILocation(line: 78, column: 9, scope: !89)
!98 = !DILocation(line: 79, column: 20, scope: !89)
!99 = !DILocation(line: 79, column: 9, scope: !89)
!100 = !DILocation(line: 81, column: 1, scope: !73)
!101 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 84, type: !17, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !16, line: 86, type: !4)
!103 = !DILocation(line: 86, column: 15, scope: !101)
!104 = !DILocalVariable(name: "dataBadBuffer", scope: !101, file: !16, line: 87, type: !4)
!105 = !DILocation(line: 87, column: 15, scope: !101)
!106 = !DILocation(line: 87, column: 42, scope: !101)
!107 = !DILocation(line: 87, column: 31, scope: !101)
!108 = !DILocalVariable(name: "dataGoodBuffer", scope: !101, file: !16, line: 88, type: !4)
!109 = !DILocation(line: 88, column: 15, scope: !101)
!110 = !DILocation(line: 88, column: 43, scope: !101)
!111 = !DILocation(line: 88, column: 32, scope: !101)
!112 = !DILocation(line: 93, column: 16, scope: !101)
!113 = !DILocation(line: 93, column: 14, scope: !101)
!114 = !DILocation(line: 94, column: 9, scope: !101)
!115 = !DILocation(line: 94, column: 17, scope: !101)
!116 = !DILocalVariable(name: "source", scope: !117, file: !16, line: 102, type: !35)
!117 = distinct !DILexicalBlock(scope: !101, file: !16, line: 101, column: 5)
!118 = !DILocation(line: 102, column: 17, scope: !117)
!119 = !DILocation(line: 103, column: 17, scope: !117)
!120 = !DILocation(line: 103, column: 9, scope: !117)
!121 = !DILocation(line: 104, column: 9, scope: !117)
!122 = !DILocation(line: 104, column: 23, scope: !117)
!123 = !DILocation(line: 106, column: 16, scope: !117)
!124 = !DILocation(line: 106, column: 22, scope: !117)
!125 = !DILocation(line: 106, column: 9, scope: !117)
!126 = !DILocation(line: 107, column: 20, scope: !117)
!127 = !DILocation(line: 107, column: 9, scope: !117)
!128 = !DILocation(line: 109, column: 1, scope: !101)
