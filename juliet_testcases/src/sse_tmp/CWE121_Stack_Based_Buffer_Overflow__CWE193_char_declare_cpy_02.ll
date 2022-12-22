; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_02.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_02_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_02_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  store i8* %arraydecay, i8** %data, align 8, !dbg !32
  %0 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !35, metadata !DIExpression()), !dbg !37
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !37
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_02_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !37
  %2 = load i8*, i8** %data, align 8, !dbg !38
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !39
  %call = call i8* @strcpy(i8* %2, i8* %arraydecay1) #5, !dbg !40
  %3 = load i8*, i8** %data, align 8, !dbg !41
  call void @printLine(i8* %3), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_02_good() #0 !dbg !44 {
entry:
  call void @goodG2B1(), !dbg !45
  call void @goodG2B2(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* null) #5, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #5, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_02_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_02_bad(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !67 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !74
  store i8* %arraydecay, i8** %data, align 8, !dbg !77
  %0 = load i8*, i8** %data, align 8, !dbg !78
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !78
  store i8 0, i8* %arrayidx, align 1, !dbg !79
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !80, metadata !DIExpression()), !dbg !82
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !82
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !82
  %2 = load i8*, i8** %data, align 8, !dbg !83
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !84
  %call = call i8* @strcpy(i8* %2, i8* %arraydecay1) #5, !dbg !85
  %3 = load i8*, i8** %data, align 8, !dbg !86
  call void @printLine(i8* %3), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !89 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !96
  store i8* %arraydecay, i8** %data, align 8, !dbg !99
  %0 = load i8*, i8** %data, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !100
  store i8 0, i8* %arrayidx, align 1, !dbg !101
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !102, metadata !DIExpression()), !dbg !104
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !104
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !104
  %2 = load i8*, i8** %data, align 8, !dbg !105
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !106
  %call = call i8* @strcpy(i8* %2, i8* %arraydecay1) #5, !dbg !107
  %3 = load i8*, i8** %data, align 8, !dbg !108
  call void @printLine(i8* %3), !dbg !109
  ret void, !dbg !110
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_02.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_02_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_02.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 30, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 80, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 10)
!23 = !DILocation(line: 31, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 88, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 11)
!28 = !DILocation(line: 32, column: 10, scope: !11)
!29 = !DILocation(line: 37, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !31, file: !12, line: 34, column: 5)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 8)
!32 = !DILocation(line: 37, column: 14, scope: !30)
!33 = !DILocation(line: 38, column: 9, scope: !30)
!34 = !DILocation(line: 38, column: 17, scope: !30)
!35 = !DILocalVariable(name: "source", scope: !36, file: !12, line: 41, type: !25)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!37 = !DILocation(line: 41, column: 14, scope: !36)
!38 = !DILocation(line: 43, column: 16, scope: !36)
!39 = !DILocation(line: 43, column: 22, scope: !36)
!40 = !DILocation(line: 43, column: 9, scope: !36)
!41 = !DILocation(line: 44, column: 19, scope: !36)
!42 = !DILocation(line: 44, column: 9, scope: !36)
!43 = !DILocation(line: 46, column: 1, scope: !11)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_02_good", scope: !12, file: !12, line: 99, type: !13, scopeLine: 100, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 101, column: 5, scope: !44)
!46 = !DILocation(line: 102, column: 5, scope: !44)
!47 = !DILocation(line: 103, column: 1, scope: !44)
!48 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 115, type: !49, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!51, !51, !52}
!51 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !12, line: 115, type: !51)
!54 = !DILocation(line: 115, column: 14, scope: !48)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !12, line: 115, type: !52)
!56 = !DILocation(line: 115, column: 27, scope: !48)
!57 = !DILocation(line: 118, column: 22, scope: !48)
!58 = !DILocation(line: 118, column: 12, scope: !48)
!59 = !DILocation(line: 118, column: 5, scope: !48)
!60 = !DILocation(line: 120, column: 5, scope: !48)
!61 = !DILocation(line: 121, column: 5, scope: !48)
!62 = !DILocation(line: 122, column: 5, scope: !48)
!63 = !DILocation(line: 125, column: 5, scope: !48)
!64 = !DILocation(line: 126, column: 5, scope: !48)
!65 = !DILocation(line: 127, column: 5, scope: !48)
!66 = !DILocation(line: 129, column: 5, scope: !48)
!67 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocalVariable(name: "data", scope: !67, file: !12, line: 55, type: !16)
!69 = !DILocation(line: 55, column: 12, scope: !67)
!70 = !DILocalVariable(name: "dataBadBuffer", scope: !67, file: !12, line: 56, type: !20)
!71 = !DILocation(line: 56, column: 10, scope: !67)
!72 = !DILocalVariable(name: "dataGoodBuffer", scope: !67, file: !12, line: 57, type: !25)
!73 = !DILocation(line: 57, column: 10, scope: !67)
!74 = !DILocation(line: 67, column: 16, scope: !75)
!75 = distinct !DILexicalBlock(scope: !76, file: !12, line: 64, column: 5)
!76 = distinct !DILexicalBlock(scope: !67, file: !12, line: 58, column: 8)
!77 = !DILocation(line: 67, column: 14, scope: !75)
!78 = !DILocation(line: 68, column: 9, scope: !75)
!79 = !DILocation(line: 68, column: 17, scope: !75)
!80 = !DILocalVariable(name: "source", scope: !81, file: !12, line: 71, type: !25)
!81 = distinct !DILexicalBlock(scope: !67, file: !12, line: 70, column: 5)
!82 = !DILocation(line: 71, column: 14, scope: !81)
!83 = !DILocation(line: 73, column: 16, scope: !81)
!84 = !DILocation(line: 73, column: 22, scope: !81)
!85 = !DILocation(line: 73, column: 9, scope: !81)
!86 = !DILocation(line: 74, column: 19, scope: !81)
!87 = !DILocation(line: 74, column: 9, scope: !81)
!88 = !DILocation(line: 76, column: 1, scope: !67)
!89 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 79, type: !13, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !12, line: 81, type: !16)
!91 = !DILocation(line: 81, column: 12, scope: !89)
!92 = !DILocalVariable(name: "dataBadBuffer", scope: !89, file: !12, line: 82, type: !20)
!93 = !DILocation(line: 82, column: 10, scope: !89)
!94 = !DILocalVariable(name: "dataGoodBuffer", scope: !89, file: !12, line: 83, type: !25)
!95 = !DILocation(line: 83, column: 10, scope: !89)
!96 = !DILocation(line: 88, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !98, file: !12, line: 85, column: 5)
!98 = distinct !DILexicalBlock(scope: !89, file: !12, line: 84, column: 8)
!99 = !DILocation(line: 88, column: 14, scope: !97)
!100 = !DILocation(line: 89, column: 9, scope: !97)
!101 = !DILocation(line: 89, column: 17, scope: !97)
!102 = !DILocalVariable(name: "source", scope: !103, file: !12, line: 92, type: !25)
!103 = distinct !DILexicalBlock(scope: !89, file: !12, line: 91, column: 5)
!104 = !DILocation(line: 92, column: 14, scope: !103)
!105 = !DILocation(line: 94, column: 16, scope: !103)
!106 = !DILocation(line: 94, column: 22, scope: !103)
!107 = !DILocation(line: 94, column: 9, scope: !103)
!108 = !DILocation(line: 95, column: 19, scope: !103)
!109 = !DILocation(line: 95, column: 9, scope: !103)
!110 = !DILocation(line: 97, column: 1, scope: !89)
