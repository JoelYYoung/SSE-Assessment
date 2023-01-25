; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_07_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %0 = load i32, i32* @staticFive, align 4, !dbg !34
  %cmp = icmp eq i32 %0, 5, !dbg !36
  br i1 %cmp, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i32* %arraydecay, i32** %data, align 8, !dbg !40
  %1 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !44, metadata !DIExpression()), !dbg !46
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !46
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_07_bad.source to i8*), i64 44, i1 false), !dbg !46
  %3 = load i32*, i32** %data, align 8, !dbg !47
  %4 = bitcast i32* %3 to i8*, !dbg !48
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !48
  %5 = bitcast i32* %arraydecay1 to i8*, !dbg !48
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !49
  %call = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !50
  %add = add i64 %call, 1, !dbg !51
  %mul = mul i64 %add, 4, !dbg !52
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 %mul, i1 false), !dbg !48
  %6 = load i32*, i32** %data, align 8, !dbg !53
  call void @printWLine(i32* %6), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_07_good() #0 !dbg !56 {
entry:
  call void @goodG2B1(), !dbg !57
  call void @goodG2B2(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #7, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #7, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_07_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_07_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !80 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %0 = load i32, i32* @staticFive, align 4, !dbg !87
  %cmp = icmp ne i32 %0, 5, !dbg !89
  br i1 %cmp, label %if.then, label %if.else, !dbg !90

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
  %4 = bitcast i32* %3 to i8*, !dbg !103
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !103
  %5 = bitcast i32* %arraydecay1 to i8*, !dbg !103
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !104
  %call = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !105
  %add = add i64 %call, 1, !dbg !106
  %mul = mul i64 %add, 4, !dbg !107
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 %mul, i1 false), !dbg !103
  %6 = load i32*, i32** %data, align 8, !dbg !108
  call void @printWLine(i32* %6), !dbg !109
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
  %0 = load i32, i32* @staticFive, align 4, !dbg !118
  %cmp = icmp eq i32 %0, 5, !dbg !120
  br i1 %cmp, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !122
  store i32* %arraydecay, i32** %data, align 8, !dbg !124
  %1 = load i32*, i32** %data, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !125
  store i32 0, i32* %arrayidx, align 4, !dbg !126
  br label %if.end, !dbg !127

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !128, metadata !DIExpression()), !dbg !130
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !130
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !130
  %3 = load i32*, i32** %data, align 8, !dbg !131
  %4 = bitcast i32* %3 to i8*, !dbg !132
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !132
  %5 = bitcast i32* %arraydecay1 to i8*, !dbg !132
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !133
  %call = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !134
  %add = add i64 %call, 1, !dbg !135
  %mul = mul i64 %add, 4, !dbg !136
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 %mul, i1 false), !dbg !132
  %6 = load i32*, i32** %data, align 8, !dbg !137
  call void @printWLine(i32* %6), !dbg !138
  ret void, !dbg !139
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
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 30, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_07_bad", scope: !8, file: !8, line: 34, type: !17, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 36, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !22, line: 74, baseType: !9)
!22 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!23 = !DILocation(line: 36, column: 15, scope: !16)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !16, file: !8, line: 37, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 320, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 37, column: 13, scope: !16)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !16, file: !8, line: 38, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 352, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 11)
!33 = !DILocation(line: 38, column: 13, scope: !16)
!34 = !DILocation(line: 39, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !16, file: !8, line: 39, column: 8)
!36 = !DILocation(line: 39, column: 18, scope: !35)
!37 = !DILocation(line: 39, column: 8, scope: !16)
!38 = !DILocation(line: 43, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !8, line: 40, column: 5)
!40 = !DILocation(line: 43, column: 14, scope: !39)
!41 = !DILocation(line: 44, column: 9, scope: !39)
!42 = !DILocation(line: 44, column: 17, scope: !39)
!43 = !DILocation(line: 45, column: 5, scope: !39)
!44 = !DILocalVariable(name: "source", scope: !45, file: !8, line: 47, type: !30)
!45 = distinct !DILexicalBlock(scope: !16, file: !8, line: 46, column: 5)
!46 = !DILocation(line: 47, column: 17, scope: !45)
!47 = !DILocation(line: 50, column: 17, scope: !45)
!48 = !DILocation(line: 50, column: 9, scope: !45)
!49 = !DILocation(line: 50, column: 39, scope: !45)
!50 = !DILocation(line: 50, column: 32, scope: !45)
!51 = !DILocation(line: 50, column: 47, scope: !45)
!52 = !DILocation(line: 50, column: 52, scope: !45)
!53 = !DILocation(line: 51, column: 20, scope: !45)
!54 = !DILocation(line: 51, column: 9, scope: !45)
!55 = !DILocation(line: 53, column: 1, scope: !16)
!56 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_07_good", scope: !8, file: !8, line: 108, type: !17, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DILocation(line: 110, column: 5, scope: !56)
!58 = !DILocation(line: 111, column: 5, scope: !56)
!59 = !DILocation(line: 112, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 124, type: !61, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DISubroutineType(types: !62)
!62 = !{!9, !9, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !8, line: 124, type: !9)
!67 = !DILocation(line: 124, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !8, line: 124, type: !63)
!69 = !DILocation(line: 124, column: 27, scope: !60)
!70 = !DILocation(line: 127, column: 22, scope: !60)
!71 = !DILocation(line: 127, column: 12, scope: !60)
!72 = !DILocation(line: 127, column: 5, scope: !60)
!73 = !DILocation(line: 129, column: 5, scope: !60)
!74 = !DILocation(line: 130, column: 5, scope: !60)
!75 = !DILocation(line: 131, column: 5, scope: !60)
!76 = !DILocation(line: 134, column: 5, scope: !60)
!77 = !DILocation(line: 135, column: 5, scope: !60)
!78 = !DILocation(line: 136, column: 5, scope: !60)
!79 = !DILocation(line: 138, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 60, type: !17, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocalVariable(name: "data", scope: !80, file: !8, line: 62, type: !20)
!82 = !DILocation(line: 62, column: 15, scope: !80)
!83 = !DILocalVariable(name: "dataBadBuffer", scope: !80, file: !8, line: 63, type: !25)
!84 = !DILocation(line: 63, column: 13, scope: !80)
!85 = !DILocalVariable(name: "dataGoodBuffer", scope: !80, file: !8, line: 64, type: !30)
!86 = !DILocation(line: 64, column: 13, scope: !80)
!87 = !DILocation(line: 65, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !80, file: !8, line: 65, column: 8)
!89 = !DILocation(line: 65, column: 18, scope: !88)
!90 = !DILocation(line: 65, column: 8, scope: !80)
!91 = !DILocation(line: 68, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !8, line: 66, column: 5)
!93 = !DILocation(line: 69, column: 5, scope: !92)
!94 = !DILocation(line: 74, column: 16, scope: !95)
!95 = distinct !DILexicalBlock(scope: !88, file: !8, line: 71, column: 5)
!96 = !DILocation(line: 74, column: 14, scope: !95)
!97 = !DILocation(line: 75, column: 9, scope: !95)
!98 = !DILocation(line: 75, column: 17, scope: !95)
!99 = !DILocalVariable(name: "source", scope: !100, file: !8, line: 78, type: !30)
!100 = distinct !DILexicalBlock(scope: !80, file: !8, line: 77, column: 5)
!101 = !DILocation(line: 78, column: 17, scope: !100)
!102 = !DILocation(line: 81, column: 17, scope: !100)
!103 = !DILocation(line: 81, column: 9, scope: !100)
!104 = !DILocation(line: 81, column: 39, scope: !100)
!105 = !DILocation(line: 81, column: 32, scope: !100)
!106 = !DILocation(line: 81, column: 47, scope: !100)
!107 = !DILocation(line: 81, column: 52, scope: !100)
!108 = !DILocation(line: 82, column: 20, scope: !100)
!109 = !DILocation(line: 82, column: 9, scope: !100)
!110 = !DILocation(line: 84, column: 1, scope: !80)
!111 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 87, type: !17, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!112 = !DILocalVariable(name: "data", scope: !111, file: !8, line: 89, type: !20)
!113 = !DILocation(line: 89, column: 15, scope: !111)
!114 = !DILocalVariable(name: "dataBadBuffer", scope: !111, file: !8, line: 90, type: !25)
!115 = !DILocation(line: 90, column: 13, scope: !111)
!116 = !DILocalVariable(name: "dataGoodBuffer", scope: !111, file: !8, line: 91, type: !30)
!117 = !DILocation(line: 91, column: 13, scope: !111)
!118 = !DILocation(line: 92, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !111, file: !8, line: 92, column: 8)
!120 = !DILocation(line: 92, column: 18, scope: !119)
!121 = !DILocation(line: 92, column: 8, scope: !111)
!122 = !DILocation(line: 96, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !8, line: 93, column: 5)
!124 = !DILocation(line: 96, column: 14, scope: !123)
!125 = !DILocation(line: 97, column: 9, scope: !123)
!126 = !DILocation(line: 97, column: 17, scope: !123)
!127 = !DILocation(line: 98, column: 5, scope: !123)
!128 = !DILocalVariable(name: "source", scope: !129, file: !8, line: 100, type: !30)
!129 = distinct !DILexicalBlock(scope: !111, file: !8, line: 99, column: 5)
!130 = !DILocation(line: 100, column: 17, scope: !129)
!131 = !DILocation(line: 103, column: 17, scope: !129)
!132 = !DILocation(line: 103, column: 9, scope: !129)
!133 = !DILocation(line: 103, column: 39, scope: !129)
!134 = !DILocation(line: 103, column: 32, scope: !129)
!135 = !DILocation(line: 103, column: 47, scope: !129)
!136 = !DILocation(line: 103, column: 52, scope: !129)
!137 = !DILocation(line: 104, column: 20, scope: !129)
!138 = !DILocation(line: 104, column: 9, scope: !129)
!139 = !DILocation(line: 106, column: 1, scope: !111)
