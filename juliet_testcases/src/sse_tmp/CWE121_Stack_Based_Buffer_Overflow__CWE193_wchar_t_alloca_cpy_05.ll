; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_05_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !12
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 40, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 44, align 16, !dbg !32
  %3 = bitcast i8* %2 to i32*, !dbg !33
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !31
  %4 = load i32, i32* @staticTrue, align 4, !dbg !34
  %tobool = icmp ne i32 %4, 0, !dbg !34
  br i1 %tobool, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !37
  store i32* %5, i32** %data, align 8, !dbg !39
  %6 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !48
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_05_bad.source to i8*), i64 44, i1 false), !dbg !48
  %8 = load i32*, i32** %data, align 8, !dbg !49
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !50
  %call = call i32* @wcscpy(i32* %8, i32* %arraydecay) #5, !dbg !51
  %9 = load i32*, i32** %data, align 8, !dbg !52
  call void @printWLine(i32* %9), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_05_good() #0 !dbg !55 {
entry:
  call void @goodG2B1(), !dbg !56
  call void @goodG2B2(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #5, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #5, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_05_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_05_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = alloca i8, i64 40, align 16, !dbg !84
  %1 = bitcast i8* %0 to i32*, !dbg !85
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %2 = alloca i8, i64 44, align 16, !dbg !88
  %3 = bitcast i8* %2 to i32*, !dbg !89
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !87
  %4 = load i32, i32* @staticFalse, align 4, !dbg !90
  %tobool = icmp ne i32 %4, 0, !dbg !90
  br i1 %tobool, label %if.then, label %if.else, !dbg !92

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !93
  br label %if.end, !dbg !95

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !96
  store i32* %5, i32** %data, align 8, !dbg !98
  %6 = load i32*, i32** %data, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !99
  store i32 0, i32* %arrayidx, align 4, !dbg !100
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !101, metadata !DIExpression()), !dbg !103
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !103
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !103
  %8 = load i32*, i32** %data, align 8, !dbg !104
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !105
  %call = call i32* @wcscpy(i32* %8, i32* %arraydecay) #5, !dbg !106
  %9 = load i32*, i32** %data, align 8, !dbg !107
  call void @printWLine(i32* %9), !dbg !108
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !110 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %0 = alloca i8, i64 40, align 16, !dbg !115
  %1 = bitcast i8* %0 to i32*, !dbg !116
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %2 = alloca i8, i64 44, align 16, !dbg !119
  %3 = bitcast i8* %2 to i32*, !dbg !120
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !118
  %4 = load i32, i32* @staticTrue, align 4, !dbg !121
  %tobool = icmp ne i32 %4, 0, !dbg !121
  br i1 %tobool, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !124
  store i32* %5, i32** %data, align 8, !dbg !126
  %6 = load i32*, i32** %data, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !127
  store i32 0, i32* %arrayidx, align 4, !dbg !128
  br label %if.end, !dbg !129

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !130, metadata !DIExpression()), !dbg !132
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !132
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !132
  %8 = load i32*, i32** %data, align 8, !dbg !133
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !134
  %call = call i32* @wcscpy(i32* %8, i32* %arraydecay) #5, !dbg !135
  %9 = load i32*, i32** %data, align 8, !dbg !136
  call void @printWLine(i32* %9), !dbg !137
  ret void, !dbg !138
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !14, line: 30, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !14, line: 31, type: !9, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_05.c", directory: "/root/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_05_bad", scope: !14, file: !14, line: 35, type: !22, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 37, type: !6)
!25 = !DILocation(line: 37, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !21, file: !14, line: 38, type: !6)
!27 = !DILocation(line: 38, column: 15, scope: !21)
!28 = !DILocation(line: 38, column: 42, scope: !21)
!29 = !DILocation(line: 38, column: 31, scope: !21)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !21, file: !14, line: 39, type: !6)
!31 = !DILocation(line: 39, column: 15, scope: !21)
!32 = !DILocation(line: 39, column: 43, scope: !21)
!33 = !DILocation(line: 39, column: 32, scope: !21)
!34 = !DILocation(line: 40, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !21, file: !14, line: 40, column: 8)
!36 = !DILocation(line: 40, column: 8, scope: !21)
!37 = !DILocation(line: 44, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !14, line: 41, column: 5)
!39 = !DILocation(line: 44, column: 14, scope: !38)
!40 = !DILocation(line: 45, column: 9, scope: !38)
!41 = !DILocation(line: 45, column: 17, scope: !38)
!42 = !DILocation(line: 46, column: 5, scope: !38)
!43 = !DILocalVariable(name: "source", scope: !44, file: !14, line: 48, type: !45)
!44 = distinct !DILexicalBlock(scope: !21, file: !14, line: 47, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 352, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 11)
!48 = !DILocation(line: 48, column: 17, scope: !44)
!49 = !DILocation(line: 50, column: 16, scope: !44)
!50 = !DILocation(line: 50, column: 22, scope: !44)
!51 = !DILocation(line: 50, column: 9, scope: !44)
!52 = !DILocation(line: 51, column: 20, scope: !44)
!53 = !DILocation(line: 51, column: 9, scope: !44)
!54 = !DILocation(line: 53, column: 1, scope: !21)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_05_good", scope: !14, file: !14, line: 106, type: !22, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DILocation(line: 108, column: 5, scope: !55)
!57 = !DILocation(line: 109, column: 5, scope: !55)
!58 = !DILocation(line: 110, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 122, type: !60, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DISubroutineType(types: !61)
!61 = !{!9, !9, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !14, line: 122, type: !9)
!66 = !DILocation(line: 122, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !14, line: 122, type: !62)
!68 = !DILocation(line: 122, column: 27, scope: !59)
!69 = !DILocation(line: 125, column: 22, scope: !59)
!70 = !DILocation(line: 125, column: 12, scope: !59)
!71 = !DILocation(line: 125, column: 5, scope: !59)
!72 = !DILocation(line: 127, column: 5, scope: !59)
!73 = !DILocation(line: 128, column: 5, scope: !59)
!74 = !DILocation(line: 129, column: 5, scope: !59)
!75 = !DILocation(line: 132, column: 5, scope: !59)
!76 = !DILocation(line: 133, column: 5, scope: !59)
!77 = !DILocation(line: 134, column: 5, scope: !59)
!78 = !DILocation(line: 136, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 60, type: !22, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocalVariable(name: "data", scope: !79, file: !14, line: 62, type: !6)
!81 = !DILocation(line: 62, column: 15, scope: !79)
!82 = !DILocalVariable(name: "dataBadBuffer", scope: !79, file: !14, line: 63, type: !6)
!83 = !DILocation(line: 63, column: 15, scope: !79)
!84 = !DILocation(line: 63, column: 42, scope: !79)
!85 = !DILocation(line: 63, column: 31, scope: !79)
!86 = !DILocalVariable(name: "dataGoodBuffer", scope: !79, file: !14, line: 64, type: !6)
!87 = !DILocation(line: 64, column: 15, scope: !79)
!88 = !DILocation(line: 64, column: 43, scope: !79)
!89 = !DILocation(line: 64, column: 32, scope: !79)
!90 = !DILocation(line: 65, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !79, file: !14, line: 65, column: 8)
!92 = !DILocation(line: 65, column: 8, scope: !79)
!93 = !DILocation(line: 68, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !14, line: 66, column: 5)
!95 = !DILocation(line: 69, column: 5, scope: !94)
!96 = !DILocation(line: 74, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !91, file: !14, line: 71, column: 5)
!98 = !DILocation(line: 74, column: 14, scope: !97)
!99 = !DILocation(line: 75, column: 9, scope: !97)
!100 = !DILocation(line: 75, column: 17, scope: !97)
!101 = !DILocalVariable(name: "source", scope: !102, file: !14, line: 78, type: !45)
!102 = distinct !DILexicalBlock(scope: !79, file: !14, line: 77, column: 5)
!103 = !DILocation(line: 78, column: 17, scope: !102)
!104 = !DILocation(line: 80, column: 16, scope: !102)
!105 = !DILocation(line: 80, column: 22, scope: !102)
!106 = !DILocation(line: 80, column: 9, scope: !102)
!107 = !DILocation(line: 81, column: 20, scope: !102)
!108 = !DILocation(line: 81, column: 9, scope: !102)
!109 = !DILocation(line: 83, column: 1, scope: !79)
!110 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 86, type: !22, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!111 = !DILocalVariable(name: "data", scope: !110, file: !14, line: 88, type: !6)
!112 = !DILocation(line: 88, column: 15, scope: !110)
!113 = !DILocalVariable(name: "dataBadBuffer", scope: !110, file: !14, line: 89, type: !6)
!114 = !DILocation(line: 89, column: 15, scope: !110)
!115 = !DILocation(line: 89, column: 42, scope: !110)
!116 = !DILocation(line: 89, column: 31, scope: !110)
!117 = !DILocalVariable(name: "dataGoodBuffer", scope: !110, file: !14, line: 90, type: !6)
!118 = !DILocation(line: 90, column: 15, scope: !110)
!119 = !DILocation(line: 90, column: 43, scope: !110)
!120 = !DILocation(line: 90, column: 32, scope: !110)
!121 = !DILocation(line: 91, column: 8, scope: !122)
!122 = distinct !DILexicalBlock(scope: !110, file: !14, line: 91, column: 8)
!123 = !DILocation(line: 91, column: 8, scope: !110)
!124 = !DILocation(line: 95, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !14, line: 92, column: 5)
!126 = !DILocation(line: 95, column: 14, scope: !125)
!127 = !DILocation(line: 96, column: 9, scope: !125)
!128 = !DILocation(line: 96, column: 17, scope: !125)
!129 = !DILocation(line: 97, column: 5, scope: !125)
!130 = !DILocalVariable(name: "source", scope: !131, file: !14, line: 99, type: !45)
!131 = distinct !DILexicalBlock(scope: !110, file: !14, line: 98, column: 5)
!132 = !DILocation(line: 99, column: 17, scope: !131)
!133 = !DILocation(line: 101, column: 16, scope: !131)
!134 = !DILocation(line: 101, column: 22, scope: !131)
!135 = !DILocation(line: 101, column: 9, scope: !131)
!136 = !DILocation(line: 102, column: 20, scope: !131)
!137 = !DILocation(line: 102, column: 9, scope: !131)
!138 = !DILocation(line: 104, column: 1, scope: !110)