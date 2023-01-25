; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_05_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !12
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_05_bad() #0 !dbg !21 {
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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_05_bad.source to i8*), i64 44, i1 false), !dbg !48
  %8 = load i32*, i32** %data, align 8, !dbg !49
  %9 = bitcast i32* %8 to i8*, !dbg !50
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !50
  %10 = bitcast i32* %arraydecay to i8*, !dbg !50
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !51
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !52
  %add = add i64 %call, 1, !dbg !53
  %mul = mul i64 %add, 4, !dbg !54
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 16 %10, i64 %mul, i1 false), !dbg !50
  %11 = load i32*, i32** %data, align 8, !dbg !55
  call void @printWLine(i32* %11), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_05_good() #0 !dbg !58 {
entry:
  call void @goodG2B1(), !dbg !59
  call void @goodG2B2(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #7, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #7, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_05_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_05_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %0 = alloca i8, i64 40, align 16, !dbg !87
  %1 = bitcast i8* %0 to i32*, !dbg !88
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %2 = alloca i8, i64 44, align 16, !dbg !91
  %3 = bitcast i8* %2 to i32*, !dbg !92
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !90
  %4 = load i32, i32* @staticFalse, align 4, !dbg !93
  %tobool = icmp ne i32 %4, 0, !dbg !93
  br i1 %tobool, label %if.then, label %if.else, !dbg !95

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !96
  br label %if.end, !dbg !98

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !99
  store i32* %5, i32** %data, align 8, !dbg !101
  %6 = load i32*, i32** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !103
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !106
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !106
  %8 = load i32*, i32** %data, align 8, !dbg !107
  %9 = bitcast i32* %8 to i8*, !dbg !108
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !108
  %10 = bitcast i32* %arraydecay to i8*, !dbg !108
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !109
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !110
  %add = add i64 %call, 1, !dbg !111
  %mul = mul i64 %add, 4, !dbg !112
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 16 %10, i64 %mul, i1 false), !dbg !108
  %11 = load i32*, i32** %data, align 8, !dbg !113
  call void @printWLine(i32* %11), !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !116 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  %0 = alloca i8, i64 40, align 16, !dbg !121
  %1 = bitcast i8* %0 to i32*, !dbg !122
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !123, metadata !DIExpression()), !dbg !124
  %2 = alloca i8, i64 44, align 16, !dbg !125
  %3 = bitcast i8* %2 to i32*, !dbg !126
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !124
  %4 = load i32, i32* @staticTrue, align 4, !dbg !127
  %tobool = icmp ne i32 %4, 0, !dbg !127
  br i1 %tobool, label %if.then, label %if.end, !dbg !129

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !130
  store i32* %5, i32** %data, align 8, !dbg !132
  %6 = load i32*, i32** %data, align 8, !dbg !133
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !133
  store i32 0, i32* %arrayidx, align 4, !dbg !134
  br label %if.end, !dbg !135

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !136, metadata !DIExpression()), !dbg !138
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !138
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !138
  %8 = load i32*, i32** %data, align 8, !dbg !139
  %9 = bitcast i32* %8 to i8*, !dbg !140
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !140
  %10 = bitcast i32* %arraydecay to i8*, !dbg !140
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !141
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !142
  %add = add i64 %call, 1, !dbg !143
  %mul = mul i64 %add, 4, !dbg !144
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 16 %10, i64 %mul, i1 false), !dbg !140
  %11 = load i32*, i32** %data, align 8, !dbg !145
  call void @printWLine(i32* %11), !dbg !146
  ret void, !dbg !147
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !14, line: 30, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !14, line: 31, type: !9, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_05_bad", scope: !14, file: !14, line: 35, type: !22, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!49 = !DILocation(line: 51, column: 16, scope: !44)
!50 = !DILocation(line: 51, column: 9, scope: !44)
!51 = !DILocation(line: 51, column: 38, scope: !44)
!52 = !DILocation(line: 51, column: 31, scope: !44)
!53 = !DILocation(line: 51, column: 46, scope: !44)
!54 = !DILocation(line: 51, column: 51, scope: !44)
!55 = !DILocation(line: 52, column: 20, scope: !44)
!56 = !DILocation(line: 52, column: 9, scope: !44)
!57 = !DILocation(line: 54, column: 1, scope: !21)
!58 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_05_good", scope: !14, file: !14, line: 109, type: !22, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DILocation(line: 111, column: 5, scope: !58)
!60 = !DILocation(line: 112, column: 5, scope: !58)
!61 = !DILocation(line: 113, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 125, type: !63, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DISubroutineType(types: !64)
!64 = !{!9, !9, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !14, line: 125, type: !9)
!69 = !DILocation(line: 125, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !14, line: 125, type: !65)
!71 = !DILocation(line: 125, column: 27, scope: !62)
!72 = !DILocation(line: 128, column: 22, scope: !62)
!73 = !DILocation(line: 128, column: 12, scope: !62)
!74 = !DILocation(line: 128, column: 5, scope: !62)
!75 = !DILocation(line: 130, column: 5, scope: !62)
!76 = !DILocation(line: 131, column: 5, scope: !62)
!77 = !DILocation(line: 132, column: 5, scope: !62)
!78 = !DILocation(line: 135, column: 5, scope: !62)
!79 = !DILocation(line: 136, column: 5, scope: !62)
!80 = !DILocation(line: 137, column: 5, scope: !62)
!81 = !DILocation(line: 139, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 61, type: !22, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DILocalVariable(name: "data", scope: !82, file: !14, line: 63, type: !6)
!84 = !DILocation(line: 63, column: 15, scope: !82)
!85 = !DILocalVariable(name: "dataBadBuffer", scope: !82, file: !14, line: 64, type: !6)
!86 = !DILocation(line: 64, column: 15, scope: !82)
!87 = !DILocation(line: 64, column: 42, scope: !82)
!88 = !DILocation(line: 64, column: 31, scope: !82)
!89 = !DILocalVariable(name: "dataGoodBuffer", scope: !82, file: !14, line: 65, type: !6)
!90 = !DILocation(line: 65, column: 15, scope: !82)
!91 = !DILocation(line: 65, column: 43, scope: !82)
!92 = !DILocation(line: 65, column: 32, scope: !82)
!93 = !DILocation(line: 66, column: 8, scope: !94)
!94 = distinct !DILexicalBlock(scope: !82, file: !14, line: 66, column: 8)
!95 = !DILocation(line: 66, column: 8, scope: !82)
!96 = !DILocation(line: 69, column: 9, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !14, line: 67, column: 5)
!98 = !DILocation(line: 70, column: 5, scope: !97)
!99 = !DILocation(line: 75, column: 16, scope: !100)
!100 = distinct !DILexicalBlock(scope: !94, file: !14, line: 72, column: 5)
!101 = !DILocation(line: 75, column: 14, scope: !100)
!102 = !DILocation(line: 76, column: 9, scope: !100)
!103 = !DILocation(line: 76, column: 17, scope: !100)
!104 = !DILocalVariable(name: "source", scope: !105, file: !14, line: 79, type: !45)
!105 = distinct !DILexicalBlock(scope: !82, file: !14, line: 78, column: 5)
!106 = !DILocation(line: 79, column: 17, scope: !105)
!107 = !DILocation(line: 82, column: 16, scope: !105)
!108 = !DILocation(line: 82, column: 9, scope: !105)
!109 = !DILocation(line: 82, column: 38, scope: !105)
!110 = !DILocation(line: 82, column: 31, scope: !105)
!111 = !DILocation(line: 82, column: 46, scope: !105)
!112 = !DILocation(line: 82, column: 51, scope: !105)
!113 = !DILocation(line: 83, column: 20, scope: !105)
!114 = !DILocation(line: 83, column: 9, scope: !105)
!115 = !DILocation(line: 85, column: 1, scope: !82)
!116 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 88, type: !22, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!117 = !DILocalVariable(name: "data", scope: !116, file: !14, line: 90, type: !6)
!118 = !DILocation(line: 90, column: 15, scope: !116)
!119 = !DILocalVariable(name: "dataBadBuffer", scope: !116, file: !14, line: 91, type: !6)
!120 = !DILocation(line: 91, column: 15, scope: !116)
!121 = !DILocation(line: 91, column: 42, scope: !116)
!122 = !DILocation(line: 91, column: 31, scope: !116)
!123 = !DILocalVariable(name: "dataGoodBuffer", scope: !116, file: !14, line: 92, type: !6)
!124 = !DILocation(line: 92, column: 15, scope: !116)
!125 = !DILocation(line: 92, column: 43, scope: !116)
!126 = !DILocation(line: 92, column: 32, scope: !116)
!127 = !DILocation(line: 93, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !116, file: !14, line: 93, column: 8)
!129 = !DILocation(line: 93, column: 8, scope: !116)
!130 = !DILocation(line: 97, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !14, line: 94, column: 5)
!132 = !DILocation(line: 97, column: 14, scope: !131)
!133 = !DILocation(line: 98, column: 9, scope: !131)
!134 = !DILocation(line: 98, column: 17, scope: !131)
!135 = !DILocation(line: 99, column: 5, scope: !131)
!136 = !DILocalVariable(name: "source", scope: !137, file: !14, line: 101, type: !45)
!137 = distinct !DILexicalBlock(scope: !116, file: !14, line: 100, column: 5)
!138 = !DILocation(line: 101, column: 17, scope: !137)
!139 = !DILocation(line: 104, column: 16, scope: !137)
!140 = !DILocation(line: 104, column: 9, scope: !137)
!141 = !DILocation(line: 104, column: 38, scope: !137)
!142 = !DILocation(line: 104, column: 31, scope: !137)
!143 = !DILocation(line: 104, column: 46, scope: !137)
!144 = !DILocation(line: 104, column: 51, scope: !137)
!145 = !DILocation(line: 105, column: 20, scope: !137)
!146 = !DILocation(line: 105, column: 9, scope: !137)
!147 = !DILocation(line: 107, column: 1, scope: !116)
