; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_08_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 200, align 16, !dbg !21
  %1 = bitcast i8* %0 to i32*, !dbg !22
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %2 = alloca i8, i64 400, align 16, !dbg !25
  %3 = bitcast i8* %2 to i32*, !dbg !26
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !24
  %call = call i32 @staticReturnsTrue(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !30
  store i32* %4, i32** %data, align 8, !dbg !32
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !39
  %6 = load i32*, i32** %data, align 8, !dbg !40
  %7 = bitcast i32* %6 to i8*, !dbg !41
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !41
  %8 = bitcast i32* %arraydecay to i8*, !dbg !41
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 400, i1 false), !dbg !41
  %9 = load i32*, i32** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 0, !dbg !42
  %10 = load i32, i32* %arrayidx, align 4, !dbg !42
  call void @printIntLine(i32 %10), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_08_good() #0 !dbg !45 {
entry:
  call void @goodG2B1(), !dbg !46
  call void @goodG2B2(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* null) #6, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #6, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_08_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_08_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !69 {
entry:
  ret i32 1, !dbg !72
}

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
  %call = call i32 @staticReturnsFalse(), !dbg !84
  %tobool = icmp ne i32 %call, 0, !dbg !84
  br i1 %tobool, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !87
  br label %if.end, !dbg !89

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !90
  store i32* %4, i32** %data, align 8, !dbg !92
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !93, metadata !DIExpression()), !dbg !95
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !95
  %6 = load i32*, i32** %data, align 8, !dbg !96
  %7 = bitcast i32* %6 to i8*, !dbg !97
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !97
  %8 = bitcast i32* %arraydecay to i8*, !dbg !97
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 400, i1 false), !dbg !97
  %9 = load i32*, i32** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 0, !dbg !98
  %10 = load i32, i32* %arrayidx, align 4, !dbg !98
  call void @printIntLine(i32 %10), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !101 {
entry:
  ret i32 0, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !103 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %0 = alloca i8, i64 200, align 16, !dbg !108
  %1 = bitcast i8* %0 to i32*, !dbg !109
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %2 = alloca i8, i64 400, align 16, !dbg !112
  %3 = bitcast i8* %2 to i32*, !dbg !113
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !111
  %call = call i32 @staticReturnsTrue(), !dbg !114
  %tobool = icmp ne i32 %call, 0, !dbg !114
  br i1 %tobool, label %if.then, label %if.end, !dbg !116

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !117
  store i32* %4, i32** %data, align 8, !dbg !119
  br label %if.end, !dbg !120

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !121, metadata !DIExpression()), !dbg !123
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !123
  %6 = load i32*, i32** %data, align 8, !dbg !124
  %7 = bitcast i32* %6 to i8*, !dbg !125
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !125
  %8 = bitcast i32* %arraydecay to i8*, !dbg !125
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 400, i1 false), !dbg !125
  %9 = load i32*, i32** %data, align 8, !dbg !126
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 0, !dbg !126
  %10 = load i32, i32* %arrayidx, align 4, !dbg !126
  call void @printIntLine(i32 %10), !dbg !127
  ret void, !dbg !128
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_08.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_08_bad", scope: !14, file: !14, line: 35, type: !15, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_08.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 37, type: !4)
!18 = !DILocation(line: 37, column: 11, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 38, type: !4)
!20 = !DILocation(line: 38, column: 11, scope: !13)
!21 = !DILocation(line: 38, column: 34, scope: !13)
!22 = !DILocation(line: 38, column: 27, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 39, type: !4)
!24 = !DILocation(line: 39, column: 11, scope: !13)
!25 = !DILocation(line: 39, column: 35, scope: !13)
!26 = !DILocation(line: 39, column: 28, scope: !13)
!27 = !DILocation(line: 40, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 8)
!29 = !DILocation(line: 40, column: 8, scope: !13)
!30 = !DILocation(line: 44, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !14, line: 41, column: 5)
!32 = !DILocation(line: 44, column: 14, scope: !31)
!33 = !DILocation(line: 45, column: 5, scope: !31)
!34 = !DILocalVariable(name: "source", scope: !35, file: !14, line: 47, type: !36)
!35 = distinct !DILexicalBlock(scope: !13, file: !14, line: 46, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 47, column: 13, scope: !35)
!40 = !DILocation(line: 49, column: 16, scope: !35)
!41 = !DILocation(line: 49, column: 9, scope: !35)
!42 = !DILocation(line: 50, column: 22, scope: !35)
!43 = !DILocation(line: 50, column: 9, scope: !35)
!44 = !DILocation(line: 52, column: 1, scope: !13)
!45 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_08_good", scope: !14, file: !14, line: 101, type: !15, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocation(line: 103, column: 5, scope: !45)
!47 = !DILocation(line: 104, column: 5, scope: !45)
!48 = !DILocation(line: 105, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 117, type: !50, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!5, !5, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !14, line: 117, type: !5)
!56 = !DILocation(line: 117, column: 14, scope: !49)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !14, line: 117, type: !52)
!58 = !DILocation(line: 117, column: 27, scope: !49)
!59 = !DILocation(line: 120, column: 22, scope: !49)
!60 = !DILocation(line: 120, column: 12, scope: !49)
!61 = !DILocation(line: 120, column: 5, scope: !49)
!62 = !DILocation(line: 122, column: 5, scope: !49)
!63 = !DILocation(line: 123, column: 5, scope: !49)
!64 = !DILocation(line: 124, column: 5, scope: !49)
!65 = !DILocation(line: 127, column: 5, scope: !49)
!66 = !DILocation(line: 128, column: 5, scope: !49)
!67 = !DILocation(line: 129, column: 5, scope: !49)
!68 = !DILocation(line: 131, column: 5, scope: !49)
!69 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !14, file: !14, line: 23, type: !70, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!5}
!72 = !DILocation(line: 25, column: 5, scope: !69)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 59, type: !15, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !14, line: 61, type: !4)
!75 = !DILocation(line: 61, column: 11, scope: !73)
!76 = !DILocalVariable(name: "dataBadBuffer", scope: !73, file: !14, line: 62, type: !4)
!77 = !DILocation(line: 62, column: 11, scope: !73)
!78 = !DILocation(line: 62, column: 34, scope: !73)
!79 = !DILocation(line: 62, column: 27, scope: !73)
!80 = !DILocalVariable(name: "dataGoodBuffer", scope: !73, file: !14, line: 63, type: !4)
!81 = !DILocation(line: 63, column: 11, scope: !73)
!82 = !DILocation(line: 63, column: 35, scope: !73)
!83 = !DILocation(line: 63, column: 28, scope: !73)
!84 = !DILocation(line: 64, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !73, file: !14, line: 64, column: 8)
!86 = !DILocation(line: 64, column: 8, scope: !73)
!87 = !DILocation(line: 67, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !14, line: 65, column: 5)
!89 = !DILocation(line: 68, column: 5, scope: !88)
!90 = !DILocation(line: 72, column: 16, scope: !91)
!91 = distinct !DILexicalBlock(scope: !85, file: !14, line: 70, column: 5)
!92 = !DILocation(line: 72, column: 14, scope: !91)
!93 = !DILocalVariable(name: "source", scope: !94, file: !14, line: 75, type: !36)
!94 = distinct !DILexicalBlock(scope: !73, file: !14, line: 74, column: 5)
!95 = !DILocation(line: 75, column: 13, scope: !94)
!96 = !DILocation(line: 77, column: 16, scope: !94)
!97 = !DILocation(line: 77, column: 9, scope: !94)
!98 = !DILocation(line: 78, column: 22, scope: !94)
!99 = !DILocation(line: 78, column: 9, scope: !94)
!100 = !DILocation(line: 80, column: 1, scope: !73)
!101 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !14, file: !14, line: 28, type: !70, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocation(line: 30, column: 5, scope: !101)
!103 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 83, type: !15, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !14, line: 85, type: !4)
!105 = !DILocation(line: 85, column: 11, scope: !103)
!106 = !DILocalVariable(name: "dataBadBuffer", scope: !103, file: !14, line: 86, type: !4)
!107 = !DILocation(line: 86, column: 11, scope: !103)
!108 = !DILocation(line: 86, column: 34, scope: !103)
!109 = !DILocation(line: 86, column: 27, scope: !103)
!110 = !DILocalVariable(name: "dataGoodBuffer", scope: !103, file: !14, line: 87, type: !4)
!111 = !DILocation(line: 87, column: 11, scope: !103)
!112 = !DILocation(line: 87, column: 35, scope: !103)
!113 = !DILocation(line: 87, column: 28, scope: !103)
!114 = !DILocation(line: 88, column: 8, scope: !115)
!115 = distinct !DILexicalBlock(scope: !103, file: !14, line: 88, column: 8)
!116 = !DILocation(line: 88, column: 8, scope: !103)
!117 = !DILocation(line: 91, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !14, line: 89, column: 5)
!119 = !DILocation(line: 91, column: 14, scope: !118)
!120 = !DILocation(line: 92, column: 5, scope: !118)
!121 = !DILocalVariable(name: "source", scope: !122, file: !14, line: 94, type: !36)
!122 = distinct !DILexicalBlock(scope: !103, file: !14, line: 93, column: 5)
!123 = !DILocation(line: 94, column: 13, scope: !122)
!124 = !DILocation(line: 96, column: 16, scope: !122)
!125 = !DILocation(line: 96, column: 9, scope: !122)
!126 = !DILocation(line: 97, column: 22, scope: !122)
!127 = !DILocation(line: 97, column: 9, scope: !122)
!128 = !DILocation(line: 99, column: 1, scope: !103)
