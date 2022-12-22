; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_45_goodG2BData = internal global i32* null, align 8, !dbg !8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !35
  %0 = load i32*, i32** %data, align 8, !dbg !36
  store i32* %0, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_45_badData, align 8, !dbg !37
  call void @badSink(), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_45_good() #0 !dbg !40 {
entry:
  call void @goodG2B(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %call = call i64 @time(i64* null) #6, !dbg !53
  %conv = trunc i64 %call to i32, !dbg !54
  call void @srand(i32 %conv) #6, !dbg !55
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_45_good(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !59
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_45_bad(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !61
  ret i32 0, !dbg !62
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !63 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !64, metadata !DIExpression()), !dbg !65
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_45_badData, align 8, !dbg !66
  store i32* %0, i32** %data, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !67, metadata !DIExpression()), !dbg !69
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !69
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !69
  %2 = load i32*, i32** %data, align 8, !dbg !70
  %3 = bitcast i32* %2 to i8*, !dbg !71
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !71
  %4 = bitcast i32* %arraydecay to i8*, !dbg !71
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !71
  %5 = load i32*, i32** %data, align 8, !dbg !72
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !72
  %6 = load i32, i32* %arrayidx, align 4, !dbg !72
  call void @printIntLine(i32 %6), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !75 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !82
  store i32* %arraydecay, i32** %data, align 8, !dbg !83
  %0 = load i32*, i32** %data, align 8, !dbg !84
  store i32* %0, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_45_goodG2BData, align 8, !dbg !85
  call void @goodG2BSink(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !88 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !89, metadata !DIExpression()), !dbg !90
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_45_goodG2BData, align 8, !dbg !91
  store i32* %0, i32** %data, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !92, metadata !DIExpression()), !dbg !94
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !94
  %2 = load i32*, i32** %data, align 8, !dbg !95
  %3 = bitcast i32* %2 to i8*, !dbg !96
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !96
  %4 = bitcast i32* %arraydecay to i8*, !dbg !96
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !96
  %5 = load i32*, i32** %data, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !97
  %6 = load i32, i32* %arrayidx, align 4, !dbg !97
  call void @printIntLine(i32 %6), !dbg !98
  ret void, !dbg !99
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_45_badData", scope: !2, file: !10, line: 19, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_45_goodG2BData", scope: !2, file: !10, line: 20, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_45.c", directory: "/root/SSE-Assessment")
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_45_bad", scope: !10, file: !10, line: 35, type: !20, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !10, line: 37, type: !11)
!23 = !DILocation(line: 37, column: 11, scope: !19)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !10, line: 38, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 1600, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 38, column: 9, scope: !19)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !10, line: 39, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 39, column: 9, scope: !19)
!34 = !DILocation(line: 42, column: 12, scope: !19)
!35 = !DILocation(line: 42, column: 10, scope: !19)
!36 = !DILocation(line: 43, column: 81, scope: !19)
!37 = !DILocation(line: 43, column: 79, scope: !19)
!38 = !DILocation(line: 44, column: 5, scope: !19)
!39 = !DILocation(line: 45, column: 1, scope: !19)
!40 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_45_good", scope: !10, file: !10, line: 74, type: !20, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!41 = !DILocation(line: 76, column: 5, scope: !40)
!42 = !DILocation(line: 77, column: 1, scope: !40)
!43 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 88, type: !44, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!44 = !DISubroutineType(types: !45)
!45 = !{!12, !12, !46}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !43, file: !10, line: 88, type: !12)
!50 = !DILocation(line: 88, column: 14, scope: !43)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !43, file: !10, line: 88, type: !46)
!52 = !DILocation(line: 88, column: 27, scope: !43)
!53 = !DILocation(line: 91, column: 22, scope: !43)
!54 = !DILocation(line: 91, column: 12, scope: !43)
!55 = !DILocation(line: 91, column: 5, scope: !43)
!56 = !DILocation(line: 93, column: 5, scope: !43)
!57 = !DILocation(line: 94, column: 5, scope: !43)
!58 = !DILocation(line: 95, column: 5, scope: !43)
!59 = !DILocation(line: 98, column: 5, scope: !43)
!60 = !DILocation(line: 99, column: 5, scope: !43)
!61 = !DILocation(line: 100, column: 5, scope: !43)
!62 = !DILocation(line: 102, column: 5, scope: !43)
!63 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 24, type: !20, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DILocalVariable(name: "data", scope: !63, file: !10, line: 26, type: !11)
!65 = !DILocation(line: 26, column: 11, scope: !63)
!66 = !DILocation(line: 26, column: 18, scope: !63)
!67 = !DILocalVariable(name: "source", scope: !68, file: !10, line: 28, type: !30)
!68 = distinct !DILexicalBlock(scope: !63, file: !10, line: 27, column: 5)
!69 = !DILocation(line: 28, column: 13, scope: !68)
!70 = !DILocation(line: 30, column: 17, scope: !68)
!71 = !DILocation(line: 30, column: 9, scope: !68)
!72 = !DILocation(line: 31, column: 22, scope: !68)
!73 = !DILocation(line: 31, column: 9, scope: !68)
!74 = !DILocation(line: 33, column: 1, scope: !63)
!75 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 63, type: !20, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DILocalVariable(name: "data", scope: !75, file: !10, line: 65, type: !11)
!77 = !DILocation(line: 65, column: 11, scope: !75)
!78 = !DILocalVariable(name: "dataBadBuffer", scope: !75, file: !10, line: 66, type: !25)
!79 = !DILocation(line: 66, column: 9, scope: !75)
!80 = !DILocalVariable(name: "dataGoodBuffer", scope: !75, file: !10, line: 67, type: !30)
!81 = !DILocation(line: 67, column: 9, scope: !75)
!82 = !DILocation(line: 69, column: 12, scope: !75)
!83 = !DILocation(line: 69, column: 10, scope: !75)
!84 = !DILocation(line: 70, column: 85, scope: !75)
!85 = !DILocation(line: 70, column: 83, scope: !75)
!86 = !DILocation(line: 71, column: 5, scope: !75)
!87 = !DILocation(line: 72, column: 1, scope: !75)
!88 = distinct !DISubprogram(name: "goodG2BSink", scope: !10, file: !10, line: 52, type: !20, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!89 = !DILocalVariable(name: "data", scope: !88, file: !10, line: 54, type: !11)
!90 = !DILocation(line: 54, column: 11, scope: !88)
!91 = !DILocation(line: 54, column: 18, scope: !88)
!92 = !DILocalVariable(name: "source", scope: !93, file: !10, line: 56, type: !30)
!93 = distinct !DILexicalBlock(scope: !88, file: !10, line: 55, column: 5)
!94 = !DILocation(line: 56, column: 13, scope: !93)
!95 = !DILocation(line: 58, column: 17, scope: !93)
!96 = !DILocation(line: 58, column: 9, scope: !93)
!97 = !DILocation(line: 59, column: 22, scope: !93)
!98 = !DILocation(line: 59, column: 9, scope: !93)
!99 = !DILocation(line: 61, column: 1, scope: !88)
