; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_05_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %0 = load i32, i32* @staticTrue, align 4, !dbg !36
  %tobool = icmp ne i32 %0, 0, !dbg !36
  br i1 %tobool, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i32* %arraydecay, i32** %data, align 8, !dbg !41
  %1 = load i32*, i32** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  br label %if.end, !dbg !44

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !45, metadata !DIExpression()), !dbg !47
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !47
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_05_bad.source to i8*), i64 44, i1 false), !dbg !47
  %3 = load i32*, i32** %data, align 8, !dbg !48
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !49
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !50
  %call = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !51
  %add = add i64 %call, 1, !dbg !52
  %call3 = call i32* @wcsncpy(i32* %3, i32* %arraydecay1, i64 %add) #7, !dbg !53
  %4 = load i32*, i32** %data, align 8, !dbg !54
  call void @printWLine(i32* %4), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_05_good() #0 !dbg !57 {
entry:
  call void @goodG2B1(), !dbg !58
  call void @goodG2B2(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #7, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #7, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_05_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_05_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %0 = load i32, i32* @staticFalse, align 4, !dbg !88
  %tobool = icmp ne i32 %0, 0, !dbg !88
  br i1 %tobool, label %if.then, label %if.else, !dbg !90

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !91
  br label %if.end, !dbg !93

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !94
  store i32* %arraydecay, i32** %data, align 8, !dbg !96
  %1 = load i32*, i32** %data, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !97
  store i32 0, i32* %arrayidx, align 4, !dbg !98
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !99, metadata !DIExpression()), !dbg !101
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !101
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !101
  %3 = load i32*, i32** %data, align 8, !dbg !102
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !103
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !104
  %call = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !105
  %add = add i64 %call, 1, !dbg !106
  %call3 = call i32* @wcsncpy(i32* %3, i32* %arraydecay1, i64 %add) #7, !dbg !107
  %4 = load i32*, i32** %data, align 8, !dbg !108
  call void @printWLine(i32* %4), !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !111 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %0 = load i32, i32* @staticTrue, align 4, !dbg !118
  %tobool = icmp ne i32 %0, 0, !dbg !118
  br i1 %tobool, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !121
  store i32* %arraydecay, i32** %data, align 8, !dbg !123
  %1 = load i32*, i32** %data, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !124
  store i32 0, i32* %arrayidx, align 4, !dbg !125
  br label %if.end, !dbg !126

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !127, metadata !DIExpression()), !dbg !129
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !129
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !129
  %3 = load i32*, i32** %data, align 8, !dbg !130
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !131
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !132
  %call = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !133
  %add = add i64 %call, 1, !dbg !134
  %call3 = call i32* @wcsncpy(i32* %3, i32* %arraydecay1, i64 %add) #7, !dbg !135
  %4 = load i32*, i32** %data, align 8, !dbg !136
  call void @printWLine(i32* %4), !dbg !137
  ret void, !dbg !138
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 30, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 31, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_05.c", directory: "/root/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_05_bad", scope: !10, file: !10, line: 35, type: !19, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 37, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !24, line: 74, baseType: !11)
!24 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!25 = !DILocation(line: 37, column: 15, scope: !18)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !10, line: 38, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 320, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 10)
!30 = !DILocation(line: 38, column: 13, scope: !18)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !10, line: 39, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 352, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 11)
!35 = !DILocation(line: 39, column: 13, scope: !18)
!36 = !DILocation(line: 40, column: 8, scope: !37)
!37 = distinct !DILexicalBlock(scope: !18, file: !10, line: 40, column: 8)
!38 = !DILocation(line: 40, column: 8, scope: !18)
!39 = !DILocation(line: 44, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !10, line: 41, column: 5)
!41 = !DILocation(line: 44, column: 14, scope: !40)
!42 = !DILocation(line: 45, column: 9, scope: !40)
!43 = !DILocation(line: 45, column: 17, scope: !40)
!44 = !DILocation(line: 46, column: 5, scope: !40)
!45 = !DILocalVariable(name: "source", scope: !46, file: !10, line: 48, type: !32)
!46 = distinct !DILexicalBlock(scope: !18, file: !10, line: 47, column: 5)
!47 = !DILocation(line: 48, column: 17, scope: !46)
!48 = !DILocation(line: 51, column: 17, scope: !46)
!49 = !DILocation(line: 51, column: 23, scope: !46)
!50 = !DILocation(line: 51, column: 38, scope: !46)
!51 = !DILocation(line: 51, column: 31, scope: !46)
!52 = !DILocation(line: 51, column: 46, scope: !46)
!53 = !DILocation(line: 51, column: 9, scope: !46)
!54 = !DILocation(line: 52, column: 20, scope: !46)
!55 = !DILocation(line: 52, column: 9, scope: !46)
!56 = !DILocation(line: 54, column: 1, scope: !18)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_05_good", scope: !10, file: !10, line: 109, type: !19, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DILocation(line: 111, column: 5, scope: !57)
!59 = !DILocation(line: 112, column: 5, scope: !57)
!60 = !DILocation(line: 113, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 125, type: !62, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DISubroutineType(types: !63)
!63 = !{!11, !11, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !10, line: 125, type: !11)
!68 = !DILocation(line: 125, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !10, line: 125, type: !64)
!70 = !DILocation(line: 125, column: 27, scope: !61)
!71 = !DILocation(line: 128, column: 22, scope: !61)
!72 = !DILocation(line: 128, column: 12, scope: !61)
!73 = !DILocation(line: 128, column: 5, scope: !61)
!74 = !DILocation(line: 130, column: 5, scope: !61)
!75 = !DILocation(line: 131, column: 5, scope: !61)
!76 = !DILocation(line: 132, column: 5, scope: !61)
!77 = !DILocation(line: 135, column: 5, scope: !61)
!78 = !DILocation(line: 136, column: 5, scope: !61)
!79 = !DILocation(line: 137, column: 5, scope: !61)
!80 = !DILocation(line: 139, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 61, type: !19, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocalVariable(name: "data", scope: !81, file: !10, line: 63, type: !22)
!83 = !DILocation(line: 63, column: 15, scope: !81)
!84 = !DILocalVariable(name: "dataBadBuffer", scope: !81, file: !10, line: 64, type: !27)
!85 = !DILocation(line: 64, column: 13, scope: !81)
!86 = !DILocalVariable(name: "dataGoodBuffer", scope: !81, file: !10, line: 65, type: !32)
!87 = !DILocation(line: 65, column: 13, scope: !81)
!88 = !DILocation(line: 66, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !81, file: !10, line: 66, column: 8)
!90 = !DILocation(line: 66, column: 8, scope: !81)
!91 = !DILocation(line: 69, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !10, line: 67, column: 5)
!93 = !DILocation(line: 70, column: 5, scope: !92)
!94 = !DILocation(line: 75, column: 16, scope: !95)
!95 = distinct !DILexicalBlock(scope: !89, file: !10, line: 72, column: 5)
!96 = !DILocation(line: 75, column: 14, scope: !95)
!97 = !DILocation(line: 76, column: 9, scope: !95)
!98 = !DILocation(line: 76, column: 17, scope: !95)
!99 = !DILocalVariable(name: "source", scope: !100, file: !10, line: 79, type: !32)
!100 = distinct !DILexicalBlock(scope: !81, file: !10, line: 78, column: 5)
!101 = !DILocation(line: 79, column: 17, scope: !100)
!102 = !DILocation(line: 82, column: 17, scope: !100)
!103 = !DILocation(line: 82, column: 23, scope: !100)
!104 = !DILocation(line: 82, column: 38, scope: !100)
!105 = !DILocation(line: 82, column: 31, scope: !100)
!106 = !DILocation(line: 82, column: 46, scope: !100)
!107 = !DILocation(line: 82, column: 9, scope: !100)
!108 = !DILocation(line: 83, column: 20, scope: !100)
!109 = !DILocation(line: 83, column: 9, scope: !100)
!110 = !DILocation(line: 85, column: 1, scope: !81)
!111 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 88, type: !19, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!112 = !DILocalVariable(name: "data", scope: !111, file: !10, line: 90, type: !22)
!113 = !DILocation(line: 90, column: 15, scope: !111)
!114 = !DILocalVariable(name: "dataBadBuffer", scope: !111, file: !10, line: 91, type: !27)
!115 = !DILocation(line: 91, column: 13, scope: !111)
!116 = !DILocalVariable(name: "dataGoodBuffer", scope: !111, file: !10, line: 92, type: !32)
!117 = !DILocation(line: 92, column: 13, scope: !111)
!118 = !DILocation(line: 93, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !111, file: !10, line: 93, column: 8)
!120 = !DILocation(line: 93, column: 8, scope: !111)
!121 = !DILocation(line: 97, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !10, line: 94, column: 5)
!123 = !DILocation(line: 97, column: 14, scope: !122)
!124 = !DILocation(line: 98, column: 9, scope: !122)
!125 = !DILocation(line: 98, column: 17, scope: !122)
!126 = !DILocation(line: 99, column: 5, scope: !122)
!127 = !DILocalVariable(name: "source", scope: !128, file: !10, line: 101, type: !32)
!128 = distinct !DILexicalBlock(scope: !111, file: !10, line: 100, column: 5)
!129 = !DILocation(line: 101, column: 17, scope: !128)
!130 = !DILocation(line: 104, column: 17, scope: !128)
!131 = !DILocation(line: 104, column: 23, scope: !128)
!132 = !DILocation(line: 104, column: 38, scope: !128)
!133 = !DILocation(line: 104, column: 31, scope: !128)
!134 = !DILocation(line: 104, column: 46, scope: !128)
!135 = !DILocation(line: 104, column: 9, scope: !128)
!136 = !DILocation(line: 105, column: 20, scope: !128)
!137 = !DILocation(line: 105, column: 9, scope: !128)
!138 = !DILocation(line: 107, column: 1, scope: !111)
