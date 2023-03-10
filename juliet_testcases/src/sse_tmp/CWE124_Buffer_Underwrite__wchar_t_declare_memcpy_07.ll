; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_07.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !29
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !30
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  %0 = load i32, i32* @staticFive, align 4, !dbg !33
  %cmp = icmp eq i32 %0, 5, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !37
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !39
  store i32* %add.ptr, i32** %data, align 8, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !42, metadata !DIExpression()), !dbg !44
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !45
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #5, !dbg !46
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !47
  store i32 0, i32* %arrayidx4, align 4, !dbg !48
  %1 = load i32*, i32** %data, align 8, !dbg !49
  %2 = bitcast i32* %1 to i8*, !dbg !50
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !50
  %3 = bitcast i32* %arraydecay5 to i8*, !dbg !50
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !50
  %4 = load i32*, i32** %data, align 8, !dbg !51
  %arrayidx6 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !51
  store i32 0, i32* %arrayidx6, align 4, !dbg !52
  %5 = load i32*, i32** %data, align 8, !dbg !53
  call void @printWLine(i32* %5), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_07_good() #0 !dbg !56 {
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
  %call = call i64 @time(i64* null) #5, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #5, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_07_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_07_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !80 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !85
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !86
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !87
  store i32 0, i32* %arrayidx, align 4, !dbg !88
  %0 = load i32, i32* @staticFive, align 4, !dbg !89
  %cmp = icmp ne i32 %0, 5, !dbg !91
  br i1 %cmp, label %if.then, label %if.else, !dbg !92

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !93
  br label %if.end, !dbg !95

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !96
  store i32* %arraydecay1, i32** %data, align 8, !dbg !98
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !99, metadata !DIExpression()), !dbg !101
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !102
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #5, !dbg !103
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !104
  store i32 0, i32* %arrayidx4, align 4, !dbg !105
  %1 = load i32*, i32** %data, align 8, !dbg !106
  %2 = bitcast i32* %1 to i8*, !dbg !107
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !107
  %3 = bitcast i32* %arraydecay5 to i8*, !dbg !107
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !107
  %4 = load i32*, i32** %data, align 8, !dbg !108
  %arrayidx6 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !108
  store i32 0, i32* %arrayidx6, align 4, !dbg !109
  %5 = load i32*, i32** %data, align 8, !dbg !110
  call void @printWLine(i32* %5), !dbg !111
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !113 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !118
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !119
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !120
  store i32 0, i32* %arrayidx, align 4, !dbg !121
  %0 = load i32, i32* @staticFive, align 4, !dbg !122
  %cmp = icmp eq i32 %0, 5, !dbg !124
  br i1 %cmp, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !126
  store i32* %arraydecay1, i32** %data, align 8, !dbg !128
  br label %if.end, !dbg !129

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !130, metadata !DIExpression()), !dbg !132
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !133
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #5, !dbg !134
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !135
  store i32 0, i32* %arrayidx4, align 4, !dbg !136
  %1 = load i32*, i32** %data, align 8, !dbg !137
  %2 = bitcast i32* %1 to i8*, !dbg !138
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !138
  %3 = bitcast i32* %arraydecay5 to i8*, !dbg !138
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !138
  %4 = load i32*, i32** %data, align 8, !dbg !139
  %arrayidx6 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !139
  store i32 0, i32* %arrayidx6, align 4, !dbg !140
  %5 = load i32*, i32** %data, align 8, !dbg !141
  call void @printWLine(i32* %5), !dbg !142
  ret void, !dbg !143
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
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_07_bad", scope: !8, file: !8, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 31, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !22, line: 74, baseType: !9)
!22 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!23 = !DILocation(line: 31, column: 15, scope: !16)
!24 = !DILocalVariable(name: "dataBuffer", scope: !16, file: !8, line: 32, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 32, column: 13, scope: !16)
!29 = !DILocation(line: 33, column: 13, scope: !16)
!30 = !DILocation(line: 33, column: 5, scope: !16)
!31 = !DILocation(line: 34, column: 5, scope: !16)
!32 = !DILocation(line: 34, column: 23, scope: !16)
!33 = !DILocation(line: 35, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !16, file: !8, line: 35, column: 8)
!35 = !DILocation(line: 35, column: 18, scope: !34)
!36 = !DILocation(line: 35, column: 8, scope: !16)
!37 = !DILocation(line: 38, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !8, line: 36, column: 5)
!39 = !DILocation(line: 38, column: 27, scope: !38)
!40 = !DILocation(line: 38, column: 14, scope: !38)
!41 = !DILocation(line: 39, column: 5, scope: !38)
!42 = !DILocalVariable(name: "source", scope: !43, file: !8, line: 41, type: !25)
!43 = distinct !DILexicalBlock(scope: !16, file: !8, line: 40, column: 5)
!44 = !DILocation(line: 41, column: 17, scope: !43)
!45 = !DILocation(line: 42, column: 17, scope: !43)
!46 = !DILocation(line: 42, column: 9, scope: !43)
!47 = !DILocation(line: 43, column: 9, scope: !43)
!48 = !DILocation(line: 43, column: 23, scope: !43)
!49 = !DILocation(line: 45, column: 16, scope: !43)
!50 = !DILocation(line: 45, column: 9, scope: !43)
!51 = !DILocation(line: 47, column: 9, scope: !43)
!52 = !DILocation(line: 47, column: 21, scope: !43)
!53 = !DILocation(line: 48, column: 20, scope: !43)
!54 = !DILocation(line: 48, column: 9, scope: !43)
!55 = !DILocation(line: 50, column: 1, scope: !16)
!56 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_memcpy_07_good", scope: !8, file: !8, line: 109, type: !17, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DILocation(line: 111, column: 5, scope: !56)
!58 = !DILocation(line: 112, column: 5, scope: !56)
!59 = !DILocation(line: 113, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 125, type: !61, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DISubroutineType(types: !62)
!62 = !{!9, !9, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !8, line: 125, type: !9)
!67 = !DILocation(line: 125, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !8, line: 125, type: !63)
!69 = !DILocation(line: 125, column: 27, scope: !60)
!70 = !DILocation(line: 128, column: 22, scope: !60)
!71 = !DILocation(line: 128, column: 12, scope: !60)
!72 = !DILocation(line: 128, column: 5, scope: !60)
!73 = !DILocation(line: 130, column: 5, scope: !60)
!74 = !DILocation(line: 131, column: 5, scope: !60)
!75 = !DILocation(line: 132, column: 5, scope: !60)
!76 = !DILocation(line: 135, column: 5, scope: !60)
!77 = !DILocation(line: 136, column: 5, scope: !60)
!78 = !DILocation(line: 137, column: 5, scope: !60)
!79 = !DILocation(line: 139, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 57, type: !17, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocalVariable(name: "data", scope: !80, file: !8, line: 59, type: !20)
!82 = !DILocation(line: 59, column: 15, scope: !80)
!83 = !DILocalVariable(name: "dataBuffer", scope: !80, file: !8, line: 60, type: !25)
!84 = !DILocation(line: 60, column: 13, scope: !80)
!85 = !DILocation(line: 61, column: 13, scope: !80)
!86 = !DILocation(line: 61, column: 5, scope: !80)
!87 = !DILocation(line: 62, column: 5, scope: !80)
!88 = !DILocation(line: 62, column: 23, scope: !80)
!89 = !DILocation(line: 63, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !80, file: !8, line: 63, column: 8)
!91 = !DILocation(line: 63, column: 18, scope: !90)
!92 = !DILocation(line: 63, column: 8, scope: !80)
!93 = !DILocation(line: 66, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !8, line: 64, column: 5)
!95 = !DILocation(line: 67, column: 5, scope: !94)
!96 = !DILocation(line: 71, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !90, file: !8, line: 69, column: 5)
!98 = !DILocation(line: 71, column: 14, scope: !97)
!99 = !DILocalVariable(name: "source", scope: !100, file: !8, line: 74, type: !25)
!100 = distinct !DILexicalBlock(scope: !80, file: !8, line: 73, column: 5)
!101 = !DILocation(line: 74, column: 17, scope: !100)
!102 = !DILocation(line: 75, column: 17, scope: !100)
!103 = !DILocation(line: 75, column: 9, scope: !100)
!104 = !DILocation(line: 76, column: 9, scope: !100)
!105 = !DILocation(line: 76, column: 23, scope: !100)
!106 = !DILocation(line: 78, column: 16, scope: !100)
!107 = !DILocation(line: 78, column: 9, scope: !100)
!108 = !DILocation(line: 80, column: 9, scope: !100)
!109 = !DILocation(line: 80, column: 21, scope: !100)
!110 = !DILocation(line: 81, column: 20, scope: !100)
!111 = !DILocation(line: 81, column: 9, scope: !100)
!112 = !DILocation(line: 83, column: 1, scope: !80)
!113 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 86, type: !17, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!114 = !DILocalVariable(name: "data", scope: !113, file: !8, line: 88, type: !20)
!115 = !DILocation(line: 88, column: 15, scope: !113)
!116 = !DILocalVariable(name: "dataBuffer", scope: !113, file: !8, line: 89, type: !25)
!117 = !DILocation(line: 89, column: 13, scope: !113)
!118 = !DILocation(line: 90, column: 13, scope: !113)
!119 = !DILocation(line: 90, column: 5, scope: !113)
!120 = !DILocation(line: 91, column: 5, scope: !113)
!121 = !DILocation(line: 91, column: 23, scope: !113)
!122 = !DILocation(line: 92, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !113, file: !8, line: 92, column: 8)
!124 = !DILocation(line: 92, column: 18, scope: !123)
!125 = !DILocation(line: 92, column: 8, scope: !113)
!126 = !DILocation(line: 95, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !8, line: 93, column: 5)
!128 = !DILocation(line: 95, column: 14, scope: !127)
!129 = !DILocation(line: 96, column: 5, scope: !127)
!130 = !DILocalVariable(name: "source", scope: !131, file: !8, line: 98, type: !25)
!131 = distinct !DILexicalBlock(scope: !113, file: !8, line: 97, column: 5)
!132 = !DILocation(line: 98, column: 17, scope: !131)
!133 = !DILocation(line: 99, column: 17, scope: !131)
!134 = !DILocation(line: 99, column: 9, scope: !131)
!135 = !DILocation(line: 100, column: 9, scope: !131)
!136 = !DILocation(line: 100, column: 23, scope: !131)
!137 = !DILocation(line: 102, column: 16, scope: !131)
!138 = !DILocation(line: 102, column: 9, scope: !131)
!139 = !DILocation(line: 104, column: 9, scope: !131)
!140 = !DILocation(line: 104, column: 21, scope: !131)
!141 = !DILocation(line: 105, column: 20, scope: !131)
!142 = !DILocation(line: 105, column: 9, scope: !131)
!143 = !DILocation(line: 107, column: 1, scope: !113)
