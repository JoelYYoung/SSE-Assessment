; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %0 = load i32, i32* @staticFive, align 4, !dbg !34
  %cmp = icmp eq i32 %0, 5, !dbg !36
  br i1 %cmp, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i32* %arraydecay, i32** %data, align 8, !dbg !40
  %1 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !44, metadata !DIExpression()), !dbg !46
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !47
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #5, !dbg !48
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !49
  store i32 0, i32* %arrayidx2, align 4, !dbg !50
  %2 = load i32*, i32** %data, align 8, !dbg !51
  %3 = bitcast i32* %2 to i8*, !dbg !52
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !52
  %4 = bitcast i32* %arraydecay3 to i8*, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !52
  %5 = load i32*, i32** %data, align 8, !dbg !53
  %arrayidx4 = getelementptr inbounds i32, i32* %5, i64 99, !dbg !53
  store i32 0, i32* %arrayidx4, align 4, !dbg !54
  %6 = load i32*, i32** %data, align 8, !dbg !55
  call void @printWLine(i32* %6), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_07_good() #0 !dbg !58 {
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
  %call = call i64 @time(i64* null) #5, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #5, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_07_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_07_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %0 = load i32, i32* @staticFive, align 4, !dbg !89
  %cmp = icmp ne i32 %0, 5, !dbg !91
  br i1 %cmp, label %if.then, label %if.else, !dbg !92

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !93
  br label %if.end, !dbg !95

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !96
  store i32* %arraydecay, i32** %data, align 8, !dbg !98
  %1 = load i32*, i32** %data, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !99
  store i32 0, i32* %arrayidx, align 4, !dbg !100
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !101, metadata !DIExpression()), !dbg !103
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !104
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #5, !dbg !105
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !106
  store i32 0, i32* %arrayidx2, align 4, !dbg !107
  %2 = load i32*, i32** %data, align 8, !dbg !108
  %3 = bitcast i32* %2 to i8*, !dbg !109
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !109
  %4 = bitcast i32* %arraydecay3 to i8*, !dbg !109
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !109
  %5 = load i32*, i32** %data, align 8, !dbg !110
  %arrayidx4 = getelementptr inbounds i32, i32* %5, i64 99, !dbg !110
  store i32 0, i32* %arrayidx4, align 4, !dbg !111
  %6 = load i32*, i32** %data, align 8, !dbg !112
  call void @printWLine(i32* %6), !dbg !113
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !115 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  %0 = load i32, i32* @staticFive, align 4, !dbg !122
  %cmp = icmp eq i32 %0, 5, !dbg !124
  br i1 %cmp, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !126
  store i32* %arraydecay, i32** %data, align 8, !dbg !128
  %1 = load i32*, i32** %data, align 8, !dbg !129
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !129
  store i32 0, i32* %arrayidx, align 4, !dbg !130
  br label %if.end, !dbg !131

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !132, metadata !DIExpression()), !dbg !134
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !135
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #5, !dbg !136
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !137
  store i32 0, i32* %arrayidx2, align 4, !dbg !138
  %2 = load i32*, i32** %data, align 8, !dbg !139
  %3 = bitcast i32* %2 to i8*, !dbg !140
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !140
  %4 = bitcast i32* %arraydecay3 to i8*, !dbg !140
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !140
  %5 = load i32*, i32** %data, align 8, !dbg !141
  %arrayidx4 = getelementptr inbounds i32, i32* %5, i64 99, !dbg !141
  store i32 0, i32* %arrayidx4, align 4, !dbg !142
  %6 = load i32*, i32** %data, align 8, !dbg !143
  call void @printWLine(i32* %6), !dbg !144
  ret void, !dbg !145
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_07_bad", scope: !8, file: !8, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 31, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !22, line: 74, baseType: !9)
!22 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!23 = !DILocation(line: 31, column: 15, scope: !16)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !16, file: !8, line: 32, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 1600, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 32, column: 13, scope: !16)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !16, file: !8, line: 33, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 33, column: 13, scope: !16)
!34 = !DILocation(line: 34, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !16, file: !8, line: 34, column: 8)
!36 = !DILocation(line: 34, column: 18, scope: !35)
!37 = !DILocation(line: 34, column: 8, scope: !16)
!38 = !DILocation(line: 38, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !8, line: 35, column: 5)
!40 = !DILocation(line: 38, column: 14, scope: !39)
!41 = !DILocation(line: 39, column: 9, scope: !39)
!42 = !DILocation(line: 39, column: 17, scope: !39)
!43 = !DILocation(line: 40, column: 5, scope: !39)
!44 = !DILocalVariable(name: "source", scope: !45, file: !8, line: 42, type: !30)
!45 = distinct !DILexicalBlock(scope: !16, file: !8, line: 41, column: 5)
!46 = !DILocation(line: 42, column: 17, scope: !45)
!47 = !DILocation(line: 43, column: 17, scope: !45)
!48 = !DILocation(line: 43, column: 9, scope: !45)
!49 = !DILocation(line: 44, column: 9, scope: !45)
!50 = !DILocation(line: 44, column: 23, scope: !45)
!51 = !DILocation(line: 46, column: 16, scope: !45)
!52 = !DILocation(line: 46, column: 9, scope: !45)
!53 = !DILocation(line: 47, column: 9, scope: !45)
!54 = !DILocation(line: 47, column: 21, scope: !45)
!55 = !DILocation(line: 48, column: 20, scope: !45)
!56 = !DILocation(line: 48, column: 9, scope: !45)
!57 = !DILocation(line: 50, column: 1, scope: !16)
!58 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_07_good", scope: !8, file: !8, line: 107, type: !17, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DILocation(line: 109, column: 5, scope: !58)
!60 = !DILocation(line: 110, column: 5, scope: !58)
!61 = !DILocation(line: 111, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 123, type: !63, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DISubroutineType(types: !64)
!64 = !{!9, !9, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !8, line: 123, type: !9)
!69 = !DILocation(line: 123, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !8, line: 123, type: !65)
!71 = !DILocation(line: 123, column: 27, scope: !62)
!72 = !DILocation(line: 126, column: 22, scope: !62)
!73 = !DILocation(line: 126, column: 12, scope: !62)
!74 = !DILocation(line: 126, column: 5, scope: !62)
!75 = !DILocation(line: 128, column: 5, scope: !62)
!76 = !DILocation(line: 129, column: 5, scope: !62)
!77 = !DILocation(line: 130, column: 5, scope: !62)
!78 = !DILocation(line: 133, column: 5, scope: !62)
!79 = !DILocation(line: 134, column: 5, scope: !62)
!80 = !DILocation(line: 135, column: 5, scope: !62)
!81 = !DILocation(line: 137, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 57, type: !17, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DILocalVariable(name: "data", scope: !82, file: !8, line: 59, type: !20)
!84 = !DILocation(line: 59, column: 15, scope: !82)
!85 = !DILocalVariable(name: "dataBadBuffer", scope: !82, file: !8, line: 60, type: !25)
!86 = !DILocation(line: 60, column: 13, scope: !82)
!87 = !DILocalVariable(name: "dataGoodBuffer", scope: !82, file: !8, line: 61, type: !30)
!88 = !DILocation(line: 61, column: 13, scope: !82)
!89 = !DILocation(line: 62, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !82, file: !8, line: 62, column: 8)
!91 = !DILocation(line: 62, column: 18, scope: !90)
!92 = !DILocation(line: 62, column: 8, scope: !82)
!93 = !DILocation(line: 65, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !8, line: 63, column: 5)
!95 = !DILocation(line: 66, column: 5, scope: !94)
!96 = !DILocation(line: 70, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !90, file: !8, line: 68, column: 5)
!98 = !DILocation(line: 70, column: 14, scope: !97)
!99 = !DILocation(line: 71, column: 9, scope: !97)
!100 = !DILocation(line: 71, column: 17, scope: !97)
!101 = !DILocalVariable(name: "source", scope: !102, file: !8, line: 74, type: !30)
!102 = distinct !DILexicalBlock(scope: !82, file: !8, line: 73, column: 5)
!103 = !DILocation(line: 74, column: 17, scope: !102)
!104 = !DILocation(line: 75, column: 17, scope: !102)
!105 = !DILocation(line: 75, column: 9, scope: !102)
!106 = !DILocation(line: 76, column: 9, scope: !102)
!107 = !DILocation(line: 76, column: 23, scope: !102)
!108 = !DILocation(line: 78, column: 16, scope: !102)
!109 = !DILocation(line: 78, column: 9, scope: !102)
!110 = !DILocation(line: 79, column: 9, scope: !102)
!111 = !DILocation(line: 79, column: 21, scope: !102)
!112 = !DILocation(line: 80, column: 20, scope: !102)
!113 = !DILocation(line: 80, column: 9, scope: !102)
!114 = !DILocation(line: 82, column: 1, scope: !82)
!115 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 85, type: !17, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!116 = !DILocalVariable(name: "data", scope: !115, file: !8, line: 87, type: !20)
!117 = !DILocation(line: 87, column: 15, scope: !115)
!118 = !DILocalVariable(name: "dataBadBuffer", scope: !115, file: !8, line: 88, type: !25)
!119 = !DILocation(line: 88, column: 13, scope: !115)
!120 = !DILocalVariable(name: "dataGoodBuffer", scope: !115, file: !8, line: 89, type: !30)
!121 = !DILocation(line: 89, column: 13, scope: !115)
!122 = !DILocation(line: 90, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !115, file: !8, line: 90, column: 8)
!124 = !DILocation(line: 90, column: 18, scope: !123)
!125 = !DILocation(line: 90, column: 8, scope: !115)
!126 = !DILocation(line: 93, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !8, line: 91, column: 5)
!128 = !DILocation(line: 93, column: 14, scope: !127)
!129 = !DILocation(line: 94, column: 9, scope: !127)
!130 = !DILocation(line: 94, column: 17, scope: !127)
!131 = !DILocation(line: 95, column: 5, scope: !127)
!132 = !DILocalVariable(name: "source", scope: !133, file: !8, line: 97, type: !30)
!133 = distinct !DILexicalBlock(scope: !115, file: !8, line: 96, column: 5)
!134 = !DILocation(line: 97, column: 17, scope: !133)
!135 = !DILocation(line: 98, column: 17, scope: !133)
!136 = !DILocation(line: 98, column: 9, scope: !133)
!137 = !DILocation(line: 99, column: 9, scope: !133)
!138 = !DILocation(line: 99, column: 23, scope: !133)
!139 = !DILocation(line: 101, column: 16, scope: !133)
!140 = !DILocation(line: 101, column: 9, scope: !133)
!141 = !DILocation(line: 102, column: 9, scope: !133)
!142 = !DILocation(line: 102, column: 21, scope: !133)
!143 = !DILocation(line: 103, column: 20, scope: !133)
!144 = !DILocation(line: 103, column: 9, scope: !133)
!145 = !DILocation(line: 105, column: 1, scope: !115)
