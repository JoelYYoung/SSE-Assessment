; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !12
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 200, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 400, align 16, !dbg !32
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
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !49
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !50
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !51
  store i32 0, i32* %arrayidx1, align 4, !dbg !52
  %7 = load i32*, i32** %data, align 8, !dbg !53
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !54
  %call3 = call i32* @wcscpy(i32* %7, i32* %arraydecay2) #4, !dbg !55
  %8 = load i32*, i32** %data, align 8, !dbg !56
  call void @printWLine(i32* %8), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_05_good() #0 !dbg !59 {
entry:
  call void @goodG2B1(), !dbg !60
  call void @goodG2B2(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #4, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #4, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_05_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_05_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %0 = alloca i8, i64 200, align 16, !dbg !88
  %1 = bitcast i8* %0 to i32*, !dbg !89
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %2 = alloca i8, i64 400, align 16, !dbg !92
  %3 = bitcast i8* %2 to i32*, !dbg !93
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !91
  %4 = load i32, i32* @staticFalse, align 4, !dbg !94
  %tobool = icmp ne i32 %4, 0, !dbg !94
  br i1 %tobool, label %if.then, label %if.else, !dbg !96

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !97
  br label %if.end, !dbg !99

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !100
  store i32* %5, i32** %data, align 8, !dbg !102
  %6 = load i32*, i32** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !103
  store i32 0, i32* %arrayidx, align 4, !dbg !104
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !105, metadata !DIExpression()), !dbg !107
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !108
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !109
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !110
  store i32 0, i32* %arrayidx1, align 4, !dbg !111
  %7 = load i32*, i32** %data, align 8, !dbg !112
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !113
  %call3 = call i32* @wcscpy(i32* %7, i32* %arraydecay2) #4, !dbg !114
  %8 = load i32*, i32** %data, align 8, !dbg !115
  call void @printWLine(i32* %8), !dbg !116
  ret void, !dbg !117
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !118 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !121, metadata !DIExpression()), !dbg !122
  %0 = alloca i8, i64 200, align 16, !dbg !123
  %1 = bitcast i8* %0 to i32*, !dbg !124
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !125, metadata !DIExpression()), !dbg !126
  %2 = alloca i8, i64 400, align 16, !dbg !127
  %3 = bitcast i8* %2 to i32*, !dbg !128
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !126
  %4 = load i32, i32* @staticTrue, align 4, !dbg !129
  %tobool = icmp ne i32 %4, 0, !dbg !129
  br i1 %tobool, label %if.then, label %if.end, !dbg !131

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !132
  store i32* %5, i32** %data, align 8, !dbg !134
  %6 = load i32*, i32** %data, align 8, !dbg !135
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !135
  store i32 0, i32* %arrayidx, align 4, !dbg !136
  br label %if.end, !dbg !137

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !138, metadata !DIExpression()), !dbg !140
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !141
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !142
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !143
  store i32 0, i32* %arrayidx1, align 4, !dbg !144
  %7 = load i32*, i32** %data, align 8, !dbg !145
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !146
  %call3 = call i32* @wcscpy(i32* %7, i32* %arraydecay2) #4, !dbg !147
  %8 = load i32*, i32** %data, align 8, !dbg !148
  call void @printWLine(i32* %8), !dbg !149
  ret void, !dbg !150
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !14, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !14, line: 26, type: !9, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_05.c", directory: "/root/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_05_bad", scope: !14, file: !14, line: 30, type: !22, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !21, file: !14, line: 33, type: !6)
!27 = !DILocation(line: 33, column: 15, scope: !21)
!28 = !DILocation(line: 33, column: 42, scope: !21)
!29 = !DILocation(line: 33, column: 31, scope: !21)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !21, file: !14, line: 34, type: !6)
!31 = !DILocation(line: 34, column: 15, scope: !21)
!32 = !DILocation(line: 34, column: 43, scope: !21)
!33 = !DILocation(line: 34, column: 32, scope: !21)
!34 = !DILocation(line: 35, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !21, file: !14, line: 35, column: 8)
!36 = !DILocation(line: 35, column: 8, scope: !21)
!37 = !DILocation(line: 39, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !14, line: 36, column: 5)
!39 = !DILocation(line: 39, column: 14, scope: !38)
!40 = !DILocation(line: 40, column: 9, scope: !38)
!41 = !DILocation(line: 40, column: 17, scope: !38)
!42 = !DILocation(line: 41, column: 5, scope: !38)
!43 = !DILocalVariable(name: "source", scope: !44, file: !14, line: 43, type: !45)
!44 = distinct !DILexicalBlock(scope: !21, file: !14, line: 42, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 43, column: 17, scope: !44)
!49 = !DILocation(line: 44, column: 17, scope: !44)
!50 = !DILocation(line: 44, column: 9, scope: !44)
!51 = !DILocation(line: 45, column: 9, scope: !44)
!52 = !DILocation(line: 45, column: 23, scope: !44)
!53 = !DILocation(line: 47, column: 16, scope: !44)
!54 = !DILocation(line: 47, column: 22, scope: !44)
!55 = !DILocation(line: 47, column: 9, scope: !44)
!56 = !DILocation(line: 48, column: 20, scope: !44)
!57 = !DILocation(line: 48, column: 9, scope: !44)
!58 = !DILocation(line: 50, column: 1, scope: !21)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_05_good", scope: !14, file: !14, line: 105, type: !22, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DILocation(line: 107, column: 5, scope: !59)
!61 = !DILocation(line: 108, column: 5, scope: !59)
!62 = !DILocation(line: 109, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 121, type: !64, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DISubroutineType(types: !65)
!65 = !{!9, !9, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !14, line: 121, type: !9)
!70 = !DILocation(line: 121, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !14, line: 121, type: !66)
!72 = !DILocation(line: 121, column: 27, scope: !63)
!73 = !DILocation(line: 124, column: 22, scope: !63)
!74 = !DILocation(line: 124, column: 12, scope: !63)
!75 = !DILocation(line: 124, column: 5, scope: !63)
!76 = !DILocation(line: 126, column: 5, scope: !63)
!77 = !DILocation(line: 127, column: 5, scope: !63)
!78 = !DILocation(line: 128, column: 5, scope: !63)
!79 = !DILocation(line: 131, column: 5, scope: !63)
!80 = !DILocation(line: 132, column: 5, scope: !63)
!81 = !DILocation(line: 133, column: 5, scope: !63)
!82 = !DILocation(line: 135, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 57, type: !22, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DILocalVariable(name: "data", scope: !83, file: !14, line: 59, type: !6)
!85 = !DILocation(line: 59, column: 15, scope: !83)
!86 = !DILocalVariable(name: "dataBadBuffer", scope: !83, file: !14, line: 60, type: !6)
!87 = !DILocation(line: 60, column: 15, scope: !83)
!88 = !DILocation(line: 60, column: 42, scope: !83)
!89 = !DILocation(line: 60, column: 31, scope: !83)
!90 = !DILocalVariable(name: "dataGoodBuffer", scope: !83, file: !14, line: 61, type: !6)
!91 = !DILocation(line: 61, column: 15, scope: !83)
!92 = !DILocation(line: 61, column: 43, scope: !83)
!93 = !DILocation(line: 61, column: 32, scope: !83)
!94 = !DILocation(line: 62, column: 8, scope: !95)
!95 = distinct !DILexicalBlock(scope: !83, file: !14, line: 62, column: 8)
!96 = !DILocation(line: 62, column: 8, scope: !83)
!97 = !DILocation(line: 65, column: 9, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !14, line: 63, column: 5)
!99 = !DILocation(line: 66, column: 5, scope: !98)
!100 = !DILocation(line: 70, column: 16, scope: !101)
!101 = distinct !DILexicalBlock(scope: !95, file: !14, line: 68, column: 5)
!102 = !DILocation(line: 70, column: 14, scope: !101)
!103 = !DILocation(line: 71, column: 9, scope: !101)
!104 = !DILocation(line: 71, column: 17, scope: !101)
!105 = !DILocalVariable(name: "source", scope: !106, file: !14, line: 74, type: !45)
!106 = distinct !DILexicalBlock(scope: !83, file: !14, line: 73, column: 5)
!107 = !DILocation(line: 74, column: 17, scope: !106)
!108 = !DILocation(line: 75, column: 17, scope: !106)
!109 = !DILocation(line: 75, column: 9, scope: !106)
!110 = !DILocation(line: 76, column: 9, scope: !106)
!111 = !DILocation(line: 76, column: 23, scope: !106)
!112 = !DILocation(line: 78, column: 16, scope: !106)
!113 = !DILocation(line: 78, column: 22, scope: !106)
!114 = !DILocation(line: 78, column: 9, scope: !106)
!115 = !DILocation(line: 79, column: 20, scope: !106)
!116 = !DILocation(line: 79, column: 9, scope: !106)
!117 = !DILocation(line: 81, column: 1, scope: !83)
!118 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 84, type: !22, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!119 = !DILocalVariable(name: "data", scope: !118, file: !14, line: 86, type: !6)
!120 = !DILocation(line: 86, column: 15, scope: !118)
!121 = !DILocalVariable(name: "dataBadBuffer", scope: !118, file: !14, line: 87, type: !6)
!122 = !DILocation(line: 87, column: 15, scope: !118)
!123 = !DILocation(line: 87, column: 42, scope: !118)
!124 = !DILocation(line: 87, column: 31, scope: !118)
!125 = !DILocalVariable(name: "dataGoodBuffer", scope: !118, file: !14, line: 88, type: !6)
!126 = !DILocation(line: 88, column: 15, scope: !118)
!127 = !DILocation(line: 88, column: 43, scope: !118)
!128 = !DILocation(line: 88, column: 32, scope: !118)
!129 = !DILocation(line: 89, column: 8, scope: !130)
!130 = distinct !DILexicalBlock(scope: !118, file: !14, line: 89, column: 8)
!131 = !DILocation(line: 89, column: 8, scope: !118)
!132 = !DILocation(line: 92, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !14, line: 90, column: 5)
!134 = !DILocation(line: 92, column: 14, scope: !133)
!135 = !DILocation(line: 93, column: 9, scope: !133)
!136 = !DILocation(line: 93, column: 17, scope: !133)
!137 = !DILocation(line: 94, column: 5, scope: !133)
!138 = !DILocalVariable(name: "source", scope: !139, file: !14, line: 96, type: !45)
!139 = distinct !DILexicalBlock(scope: !118, file: !14, line: 95, column: 5)
!140 = !DILocation(line: 96, column: 17, scope: !139)
!141 = !DILocation(line: 97, column: 17, scope: !139)
!142 = !DILocation(line: 97, column: 9, scope: !139)
!143 = !DILocation(line: 98, column: 9, scope: !139)
!144 = !DILocation(line: 98, column: 23, scope: !139)
!145 = !DILocation(line: 100, column: 16, scope: !139)
!146 = !DILocation(line: 100, column: 22, scope: !139)
!147 = !DILocation(line: 100, column: 9, scope: !139)
!148 = !DILocation(line: 101, column: 20, scope: !139)
!149 = !DILocation(line: 101, column: 9, scope: !139)
!150 = !DILocation(line: 103, column: 1, scope: !118)
