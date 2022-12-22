; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_02.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_02_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !31
  store i32* %arraydecay, i32** %data, align 8, !dbg !34
  %0 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !37, metadata !DIExpression()), !dbg !39
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !40
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #5, !dbg !41
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !42
  store i32 0, i32* %arrayidx2, align 4, !dbg !43
  %1 = load i32*, i32** %data, align 8, !dbg !44
  %2 = bitcast i32* %1 to i8*, !dbg !45
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !45
  %3 = bitcast i32* %arraydecay3 to i8*, !dbg !45
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !45
  %4 = load i32*, i32** %data, align 8, !dbg !46
  %arrayidx4 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !46
  store i32 0, i32* %arrayidx4, align 4, !dbg !47
  %5 = load i32*, i32** %data, align 8, !dbg !48
  call void @printWLine(i32* %5), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_02_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #5, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #5, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_02_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_02_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !82
  store i32* %arraydecay, i32** %data, align 8, !dbg !85
  %0 = load i32*, i32** %data, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !86
  store i32 0, i32* %arrayidx, align 4, !dbg !87
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !88, metadata !DIExpression()), !dbg !90
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !91
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #5, !dbg !92
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !93
  store i32 0, i32* %arrayidx2, align 4, !dbg !94
  %1 = load i32*, i32** %data, align 8, !dbg !95
  %2 = bitcast i32* %1 to i8*, !dbg !96
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !96
  %3 = bitcast i32* %arraydecay3 to i8*, !dbg !96
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !96
  %4 = load i32*, i32** %data, align 8, !dbg !97
  %arrayidx4 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !97
  store i32 0, i32* %arrayidx4, align 4, !dbg !98
  %5 = load i32*, i32** %data, align 8, !dbg !99
  call void @printWLine(i32* %5), !dbg !100
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !102 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !109
  store i32* %arraydecay, i32** %data, align 8, !dbg !112
  %0 = load i32*, i32** %data, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !113
  store i32 0, i32* %arrayidx, align 4, !dbg !114
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !115, metadata !DIExpression()), !dbg !117
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !118
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #5, !dbg !119
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !120
  store i32 0, i32* %arrayidx2, align 4, !dbg !121
  %1 = load i32*, i32** %data, align 8, !dbg !122
  %2 = bitcast i32* %1 to i8*, !dbg !123
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !123
  %3 = bitcast i32* %arraydecay3 to i8*, !dbg !123
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !123
  %4 = load i32*, i32** %data, align 8, !dbg !124
  %arrayidx4 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !124
  store i32 0, i32* %arrayidx4, align 4, !dbg !125
  %5 = load i32*, i32** %data, align 8, !dbg !126
  call void @printWLine(i32* %5), !dbg !127
  ret void, !dbg !128
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_02.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_02_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_02.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 27, column: 13, scope: !11)
!31 = !DILocation(line: 32, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !33, file: !12, line: 29, column: 5)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!34 = !DILocation(line: 32, column: 14, scope: !32)
!35 = !DILocation(line: 33, column: 9, scope: !32)
!36 = !DILocation(line: 33, column: 17, scope: !32)
!37 = !DILocalVariable(name: "source", scope: !38, file: !12, line: 36, type: !27)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!39 = !DILocation(line: 36, column: 17, scope: !38)
!40 = !DILocation(line: 37, column: 17, scope: !38)
!41 = !DILocation(line: 37, column: 9, scope: !38)
!42 = !DILocation(line: 38, column: 9, scope: !38)
!43 = !DILocation(line: 38, column: 23, scope: !38)
!44 = !DILocation(line: 40, column: 17, scope: !38)
!45 = !DILocation(line: 40, column: 9, scope: !38)
!46 = !DILocation(line: 41, column: 9, scope: !38)
!47 = !DILocation(line: 41, column: 21, scope: !38)
!48 = !DILocation(line: 42, column: 20, scope: !38)
!49 = !DILocation(line: 42, column: 9, scope: !38)
!50 = !DILocation(line: 44, column: 1, scope: !11)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_02_good", scope: !12, file: !12, line: 101, type: !13, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 103, column: 5, scope: !51)
!53 = !DILocation(line: 104, column: 5, scope: !51)
!54 = !DILocation(line: 105, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 117, type: !56, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!19, !19, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !12, line: 117, type: !19)
!62 = !DILocation(line: 117, column: 14, scope: !55)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !12, line: 117, type: !58)
!64 = !DILocation(line: 117, column: 27, scope: !55)
!65 = !DILocation(line: 120, column: 22, scope: !55)
!66 = !DILocation(line: 120, column: 12, scope: !55)
!67 = !DILocation(line: 120, column: 5, scope: !55)
!68 = !DILocation(line: 122, column: 5, scope: !55)
!69 = !DILocation(line: 123, column: 5, scope: !55)
!70 = !DILocation(line: 124, column: 5, scope: !55)
!71 = !DILocation(line: 127, column: 5, scope: !55)
!72 = !DILocation(line: 128, column: 5, scope: !55)
!73 = !DILocation(line: 129, column: 5, scope: !55)
!74 = !DILocation(line: 131, column: 5, scope: !55)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !12, line: 53, type: !16)
!77 = !DILocation(line: 53, column: 15, scope: !75)
!78 = !DILocalVariable(name: "dataBadBuffer", scope: !75, file: !12, line: 54, type: !22)
!79 = !DILocation(line: 54, column: 13, scope: !75)
!80 = !DILocalVariable(name: "dataGoodBuffer", scope: !75, file: !12, line: 55, type: !27)
!81 = !DILocation(line: 55, column: 13, scope: !75)
!82 = !DILocation(line: 64, column: 16, scope: !83)
!83 = distinct !DILexicalBlock(scope: !84, file: !12, line: 62, column: 5)
!84 = distinct !DILexicalBlock(scope: !75, file: !12, line: 56, column: 8)
!85 = !DILocation(line: 64, column: 14, scope: !83)
!86 = !DILocation(line: 65, column: 9, scope: !83)
!87 = !DILocation(line: 65, column: 17, scope: !83)
!88 = !DILocalVariable(name: "source", scope: !89, file: !12, line: 68, type: !27)
!89 = distinct !DILexicalBlock(scope: !75, file: !12, line: 67, column: 5)
!90 = !DILocation(line: 68, column: 17, scope: !89)
!91 = !DILocation(line: 69, column: 17, scope: !89)
!92 = !DILocation(line: 69, column: 9, scope: !89)
!93 = !DILocation(line: 70, column: 9, scope: !89)
!94 = !DILocation(line: 70, column: 23, scope: !89)
!95 = !DILocation(line: 72, column: 17, scope: !89)
!96 = !DILocation(line: 72, column: 9, scope: !89)
!97 = !DILocation(line: 73, column: 9, scope: !89)
!98 = !DILocation(line: 73, column: 21, scope: !89)
!99 = !DILocation(line: 74, column: 20, scope: !89)
!100 = !DILocation(line: 74, column: 9, scope: !89)
!101 = !DILocation(line: 76, column: 1, scope: !75)
!102 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 79, type: !13, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", scope: !102, file: !12, line: 81, type: !16)
!104 = !DILocation(line: 81, column: 15, scope: !102)
!105 = !DILocalVariable(name: "dataBadBuffer", scope: !102, file: !12, line: 82, type: !22)
!106 = !DILocation(line: 82, column: 13, scope: !102)
!107 = !DILocalVariable(name: "dataGoodBuffer", scope: !102, file: !12, line: 83, type: !27)
!108 = !DILocation(line: 83, column: 13, scope: !102)
!109 = !DILocation(line: 87, column: 16, scope: !110)
!110 = distinct !DILexicalBlock(scope: !111, file: !12, line: 85, column: 5)
!111 = distinct !DILexicalBlock(scope: !102, file: !12, line: 84, column: 8)
!112 = !DILocation(line: 87, column: 14, scope: !110)
!113 = !DILocation(line: 88, column: 9, scope: !110)
!114 = !DILocation(line: 88, column: 17, scope: !110)
!115 = !DILocalVariable(name: "source", scope: !116, file: !12, line: 91, type: !27)
!116 = distinct !DILexicalBlock(scope: !102, file: !12, line: 90, column: 5)
!117 = !DILocation(line: 91, column: 17, scope: !116)
!118 = !DILocation(line: 92, column: 17, scope: !116)
!119 = !DILocation(line: 92, column: 9, scope: !116)
!120 = !DILocation(line: 93, column: 9, scope: !116)
!121 = !DILocation(line: 93, column: 23, scope: !116)
!122 = !DILocation(line: 95, column: 17, scope: !116)
!123 = !DILocation(line: 95, column: 9, scope: !116)
!124 = !DILocation(line: 96, column: 9, scope: !116)
!125 = !DILocation(line: 96, column: 21, scope: !116)
!126 = !DILocation(line: 97, column: 20, scope: !116)
!127 = !DILocation(line: 97, column: 9, scope: !116)
!128 = !DILocation(line: 99, column: 1, scope: !102)
