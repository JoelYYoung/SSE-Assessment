; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_03.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_03_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  store i8* %arraydecay, i8** %data, align 8, !dbg !32
  %0 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !35, metadata !DIExpression()), !dbg !37
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !38
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !39
  store i8 0, i8* %arrayidx2, align 1, !dbg !40
  %1 = load i8*, i8** %data, align 8, !dbg !41
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !42
  %call = call i8* @strncpy(i8* %1, i8* %arraydecay3, i64 99) #5, !dbg !43
  %2 = load i8*, i8** %data, align 8, !dbg !44
  %arrayidx4 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !44
  store i8 0, i8* %arrayidx4, align 1, !dbg !45
  %3 = load i8*, i8** %data, align 8, !dbg !46
  call void @printLine(i8* %3), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_03_good() #0 !dbg !49 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #5, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #5, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_03_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_03_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !79
  store i8* %arraydecay, i8** %data, align 8, !dbg !82
  %0 = load i8*, i8** %data, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !83
  store i8 0, i8* %arrayidx, align 1, !dbg !84
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !85, metadata !DIExpression()), !dbg !87
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !88
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !89
  store i8 0, i8* %arrayidx2, align 1, !dbg !90
  %1 = load i8*, i8** %data, align 8, !dbg !91
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !92
  %call = call i8* @strncpy(i8* %1, i8* %arraydecay3, i64 99) #5, !dbg !93
  %2 = load i8*, i8** %data, align 8, !dbg !94
  %arrayidx4 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !94
  store i8 0, i8* %arrayidx4, align 1, !dbg !95
  %3 = load i8*, i8** %data, align 8, !dbg !96
  call void @printLine(i8* %3), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !99 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !106
  store i8* %arraydecay, i8** %data, align 8, !dbg !109
  %0 = load i8*, i8** %data, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !110
  store i8 0, i8* %arrayidx, align 1, !dbg !111
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !112, metadata !DIExpression()), !dbg !114
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !115
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !116
  store i8 0, i8* %arrayidx2, align 1, !dbg !117
  %1 = load i8*, i8** %data, align 8, !dbg !118
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !119
  %call = call i8* @strncpy(i8* %1, i8* %arraydecay3, i64 99) #5, !dbg !120
  %2 = load i8*, i8** %data, align 8, !dbg !121
  %arrayidx4 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !121
  store i8 0, i8* %arrayidx4, align 1, !dbg !122
  %3 = load i8*, i8** %data, align 8, !dbg !123
  call void @printLine(i8* %3), !dbg !124
  ret void, !dbg !125
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_03.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_03_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_03.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 27, column: 10, scope: !11)
!29 = !DILocation(line: 32, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !31, file: !12, line: 29, column: 5)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!32 = !DILocation(line: 32, column: 14, scope: !30)
!33 = !DILocation(line: 33, column: 9, scope: !30)
!34 = !DILocation(line: 33, column: 17, scope: !30)
!35 = !DILocalVariable(name: "source", scope: !36, file: !12, line: 36, type: !25)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!37 = !DILocation(line: 36, column: 14, scope: !36)
!38 = !DILocation(line: 37, column: 9, scope: !36)
!39 = !DILocation(line: 38, column: 9, scope: !36)
!40 = !DILocation(line: 38, column: 23, scope: !36)
!41 = !DILocation(line: 40, column: 17, scope: !36)
!42 = !DILocation(line: 40, column: 23, scope: !36)
!43 = !DILocation(line: 40, column: 9, scope: !36)
!44 = !DILocation(line: 41, column: 9, scope: !36)
!45 = !DILocation(line: 41, column: 21, scope: !36)
!46 = !DILocation(line: 42, column: 19, scope: !36)
!47 = !DILocation(line: 42, column: 9, scope: !36)
!48 = !DILocation(line: 44, column: 1, scope: !11)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_03_good", scope: !12, file: !12, line: 101, type: !13, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 103, column: 5, scope: !49)
!51 = !DILocation(line: 104, column: 5, scope: !49)
!52 = !DILocation(line: 105, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 117, type: !54, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!56, !56, !57}
!56 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !12, line: 117, type: !56)
!59 = !DILocation(line: 117, column: 14, scope: !53)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !12, line: 117, type: !57)
!61 = !DILocation(line: 117, column: 27, scope: !53)
!62 = !DILocation(line: 120, column: 22, scope: !53)
!63 = !DILocation(line: 120, column: 12, scope: !53)
!64 = !DILocation(line: 120, column: 5, scope: !53)
!65 = !DILocation(line: 122, column: 5, scope: !53)
!66 = !DILocation(line: 123, column: 5, scope: !53)
!67 = !DILocation(line: 124, column: 5, scope: !53)
!68 = !DILocation(line: 127, column: 5, scope: !53)
!69 = !DILocation(line: 128, column: 5, scope: !53)
!70 = !DILocation(line: 129, column: 5, scope: !53)
!71 = !DILocation(line: 131, column: 5, scope: !53)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "data", scope: !72, file: !12, line: 53, type: !16)
!74 = !DILocation(line: 53, column: 12, scope: !72)
!75 = !DILocalVariable(name: "dataBadBuffer", scope: !72, file: !12, line: 54, type: !20)
!76 = !DILocation(line: 54, column: 10, scope: !72)
!77 = !DILocalVariable(name: "dataGoodBuffer", scope: !72, file: !12, line: 55, type: !25)
!78 = !DILocation(line: 55, column: 10, scope: !72)
!79 = !DILocation(line: 64, column: 16, scope: !80)
!80 = distinct !DILexicalBlock(scope: !81, file: !12, line: 62, column: 5)
!81 = distinct !DILexicalBlock(scope: !72, file: !12, line: 56, column: 8)
!82 = !DILocation(line: 64, column: 14, scope: !80)
!83 = !DILocation(line: 65, column: 9, scope: !80)
!84 = !DILocation(line: 65, column: 17, scope: !80)
!85 = !DILocalVariable(name: "source", scope: !86, file: !12, line: 68, type: !25)
!86 = distinct !DILexicalBlock(scope: !72, file: !12, line: 67, column: 5)
!87 = !DILocation(line: 68, column: 14, scope: !86)
!88 = !DILocation(line: 69, column: 9, scope: !86)
!89 = !DILocation(line: 70, column: 9, scope: !86)
!90 = !DILocation(line: 70, column: 23, scope: !86)
!91 = !DILocation(line: 72, column: 17, scope: !86)
!92 = !DILocation(line: 72, column: 23, scope: !86)
!93 = !DILocation(line: 72, column: 9, scope: !86)
!94 = !DILocation(line: 73, column: 9, scope: !86)
!95 = !DILocation(line: 73, column: 21, scope: !86)
!96 = !DILocation(line: 74, column: 19, scope: !86)
!97 = !DILocation(line: 74, column: 9, scope: !86)
!98 = !DILocation(line: 76, column: 1, scope: !72)
!99 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 79, type: !13, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !12, line: 81, type: !16)
!101 = !DILocation(line: 81, column: 12, scope: !99)
!102 = !DILocalVariable(name: "dataBadBuffer", scope: !99, file: !12, line: 82, type: !20)
!103 = !DILocation(line: 82, column: 10, scope: !99)
!104 = !DILocalVariable(name: "dataGoodBuffer", scope: !99, file: !12, line: 83, type: !25)
!105 = !DILocation(line: 83, column: 10, scope: !99)
!106 = !DILocation(line: 87, column: 16, scope: !107)
!107 = distinct !DILexicalBlock(scope: !108, file: !12, line: 85, column: 5)
!108 = distinct !DILexicalBlock(scope: !99, file: !12, line: 84, column: 8)
!109 = !DILocation(line: 87, column: 14, scope: !107)
!110 = !DILocation(line: 88, column: 9, scope: !107)
!111 = !DILocation(line: 88, column: 17, scope: !107)
!112 = !DILocalVariable(name: "source", scope: !113, file: !12, line: 91, type: !25)
!113 = distinct !DILexicalBlock(scope: !99, file: !12, line: 90, column: 5)
!114 = !DILocation(line: 91, column: 14, scope: !113)
!115 = !DILocation(line: 92, column: 9, scope: !113)
!116 = !DILocation(line: 93, column: 9, scope: !113)
!117 = !DILocation(line: 93, column: 23, scope: !113)
!118 = !DILocation(line: 95, column: 17, scope: !113)
!119 = !DILocation(line: 95, column: 23, scope: !113)
!120 = !DILocation(line: 95, column: 9, scope: !113)
!121 = !DILocation(line: 96, column: 9, scope: !113)
!122 = !DILocation(line: 96, column: 21, scope: !113)
!123 = !DILocation(line: 97, column: 19, scope: !113)
!124 = !DILocation(line: 97, column: 9, scope: !113)
!125 = !DILocation(line: 99, column: 1, scope: !99)
