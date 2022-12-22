; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_45_goodG2BData = internal global i8* null, align 8, !dbg !8
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i8* %arraydecay, i8** %data, align 8, !dbg !35
  %0 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  %1 = load i8*, i8** %data, align 8, !dbg !38
  store i8* %1, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_45_badData, align 8, !dbg !39
  call void @badSink(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_45_good() #0 !dbg !42 {
entry:
  call void @goodG2B(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* null) #5, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #5, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_45_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_45_bad(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !64 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !65, metadata !DIExpression()), !dbg !66
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_45_badData, align 8, !dbg !67
  store i8* %0, i8** %data, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !68, metadata !DIExpression()), !dbg !70
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !70
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !70
  %2 = load i8*, i8** %data, align 8, !dbg !71
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !72
  %call = call i8* @strcpy(i8* %2, i8* %arraydecay) #5, !dbg !73
  %3 = load i8*, i8** %data, align 8, !dbg !74
  call void @printLine(i8* %3), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !84
  store i8* %arraydecay, i8** %data, align 8, !dbg !85
  %0 = load i8*, i8** %data, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !86
  store i8 0, i8* %arrayidx, align 1, !dbg !87
  %1 = load i8*, i8** %data, align 8, !dbg !88
  store i8* %1, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_45_goodG2BData, align 8, !dbg !89
  call void @goodG2BSink(), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !92 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !93, metadata !DIExpression()), !dbg !94
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_45_goodG2BData, align 8, !dbg !95
  store i8* %0, i8** %data, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !96, metadata !DIExpression()), !dbg !98
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !98
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !98
  %2 = load i8*, i8** %data, align 8, !dbg !99
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !100
  %call = call i8* @strcpy(i8* %2, i8* %arraydecay) #5, !dbg !101
  %3 = load i8*, i8** %data, align 8, !dbg !102
  call void @printLine(i8* %3), !dbg !103
  ret void, !dbg !104
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_45_badData", scope: !2, file: !10, line: 26, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_45_goodG2BData", scope: !2, file: !10, line: 27, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_45.c", directory: "/root/SSE-Assessment")
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_45_bad", scope: !10, file: !10, line: 42, type: !20, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !10, line: 44, type: !11)
!23 = !DILocation(line: 44, column: 12, scope: !19)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !10, line: 45, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 80, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 45, column: 10, scope: !19)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !10, line: 46, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 88, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 11)
!33 = !DILocation(line: 46, column: 10, scope: !19)
!34 = !DILocation(line: 49, column: 12, scope: !19)
!35 = !DILocation(line: 49, column: 10, scope: !19)
!36 = !DILocation(line: 50, column: 5, scope: !19)
!37 = !DILocation(line: 50, column: 13, scope: !19)
!38 = !DILocation(line: 51, column: 78, scope: !19)
!39 = !DILocation(line: 51, column: 76, scope: !19)
!40 = !DILocation(line: 52, column: 5, scope: !19)
!41 = !DILocation(line: 53, column: 1, scope: !19)
!42 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_45_good", scope: !10, file: !10, line: 84, type: !20, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!43 = !DILocation(line: 86, column: 5, scope: !42)
!44 = !DILocation(line: 87, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 98, type: !46, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!46 = !DISubroutineType(types: !47)
!47 = !{!48, !48, !49}
!48 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !10, line: 98, type: !48)
!51 = !DILocation(line: 98, column: 14, scope: !45)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !10, line: 98, type: !49)
!53 = !DILocation(line: 98, column: 27, scope: !45)
!54 = !DILocation(line: 101, column: 22, scope: !45)
!55 = !DILocation(line: 101, column: 12, scope: !45)
!56 = !DILocation(line: 101, column: 5, scope: !45)
!57 = !DILocation(line: 103, column: 5, scope: !45)
!58 = !DILocation(line: 104, column: 5, scope: !45)
!59 = !DILocation(line: 105, column: 5, scope: !45)
!60 = !DILocation(line: 108, column: 5, scope: !45)
!61 = !DILocation(line: 109, column: 5, scope: !45)
!62 = !DILocation(line: 110, column: 5, scope: !45)
!63 = !DILocation(line: 112, column: 5, scope: !45)
!64 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 31, type: !20, scopeLine: 32, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DILocalVariable(name: "data", scope: !64, file: !10, line: 33, type: !11)
!66 = !DILocation(line: 33, column: 12, scope: !64)
!67 = !DILocation(line: 33, column: 19, scope: !64)
!68 = !DILocalVariable(name: "source", scope: !69, file: !10, line: 35, type: !30)
!69 = distinct !DILexicalBlock(scope: !64, file: !10, line: 34, column: 5)
!70 = !DILocation(line: 35, column: 14, scope: !69)
!71 = !DILocation(line: 37, column: 16, scope: !69)
!72 = !DILocation(line: 37, column: 22, scope: !69)
!73 = !DILocation(line: 37, column: 9, scope: !69)
!74 = !DILocation(line: 38, column: 19, scope: !69)
!75 = !DILocation(line: 38, column: 9, scope: !69)
!76 = !DILocation(line: 40, column: 1, scope: !64)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 71, type: !20, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DILocalVariable(name: "data", scope: !77, file: !10, line: 73, type: !11)
!79 = !DILocation(line: 73, column: 12, scope: !77)
!80 = !DILocalVariable(name: "dataBadBuffer", scope: !77, file: !10, line: 74, type: !25)
!81 = !DILocation(line: 74, column: 10, scope: !77)
!82 = !DILocalVariable(name: "dataGoodBuffer", scope: !77, file: !10, line: 75, type: !30)
!83 = !DILocation(line: 75, column: 10, scope: !77)
!84 = !DILocation(line: 78, column: 12, scope: !77)
!85 = !DILocation(line: 78, column: 10, scope: !77)
!86 = !DILocation(line: 79, column: 5, scope: !77)
!87 = !DILocation(line: 79, column: 13, scope: !77)
!88 = !DILocation(line: 80, column: 82, scope: !77)
!89 = !DILocation(line: 80, column: 80, scope: !77)
!90 = !DILocation(line: 81, column: 5, scope: !77)
!91 = !DILocation(line: 82, column: 1, scope: !77)
!92 = distinct !DISubprogram(name: "goodG2BSink", scope: !10, file: !10, line: 60, type: !20, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!93 = !DILocalVariable(name: "data", scope: !92, file: !10, line: 62, type: !11)
!94 = !DILocation(line: 62, column: 12, scope: !92)
!95 = !DILocation(line: 62, column: 19, scope: !92)
!96 = !DILocalVariable(name: "source", scope: !97, file: !10, line: 64, type: !30)
!97 = distinct !DILexicalBlock(scope: !92, file: !10, line: 63, column: 5)
!98 = !DILocation(line: 64, column: 14, scope: !97)
!99 = !DILocation(line: 66, column: 16, scope: !97)
!100 = !DILocation(line: 66, column: 22, scope: !97)
!101 = !DILocation(line: 66, column: 9, scope: !97)
!102 = !DILocation(line: 67, column: 19, scope: !97)
!103 = !DILocation(line: 67, column: 9, scope: !97)
!104 = !DILocation(line: 69, column: 1, scope: !92)
