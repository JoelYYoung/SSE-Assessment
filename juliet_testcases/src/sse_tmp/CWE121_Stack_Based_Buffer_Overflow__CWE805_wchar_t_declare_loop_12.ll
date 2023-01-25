; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_12_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !31
  %tobool = icmp ne i32 %call, 0, !dbg !31
  br i1 %tobool, label %if.then, label %if.else, !dbg !33

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !36
  %0 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %if.end, !dbg !39

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !40
  store i32* %arraydecay1, i32** %data, align 8, !dbg !42
  %1 = load i32*, i32** %data, align 8, !dbg !43
  %arrayidx2 = getelementptr inbounds i32, i32* %1, i64 0, !dbg !43
  store i32 0, i32* %arrayidx2, align 4, !dbg !44
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !50, metadata !DIExpression()), !dbg !51
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !52
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #4, !dbg !53
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !54
  store i32 0, i32* %arrayidx5, align 4, !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !59
  %cmp = icmp ult i64 %2, 100, !dbg !61
  br i1 %cmp, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !65
  %4 = load i32, i32* %arrayidx6, align 4, !dbg !65
  %5 = load i32*, i32** %data, align 8, !dbg !66
  %6 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx7 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !66
  store i32 %4, i32* %arrayidx7, align 4, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %7, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !75
  %arrayidx8 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !75
  store i32 0, i32* %arrayidx8, align 4, !dbg !76
  %9 = load i32*, i32** %data, align 8, !dbg !77
  call void @printWLine(i32* %9), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_12_good() #0 !dbg !80 {
entry:
  call void @goodG2B(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* null) #4, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #4, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_12_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_12_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !103 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !110
  %tobool = icmp ne i32 %call, 0, !dbg !110
  br i1 %tobool, label %if.then, label %if.else, !dbg !112

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !113
  store i32* %arraydecay, i32** %data, align 8, !dbg !115
  %0 = load i32*, i32** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !116
  store i32 0, i32* %arrayidx, align 4, !dbg !117
  br label %if.end, !dbg !118

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !119
  store i32* %arraydecay1, i32** %data, align 8, !dbg !121
  %1 = load i32*, i32** %data, align 8, !dbg !122
  %arrayidx2 = getelementptr inbounds i32, i32* %1, i64 0, !dbg !122
  store i32 0, i32* %arrayidx2, align 4, !dbg !123
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !124, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !127, metadata !DIExpression()), !dbg !128
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !129
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #4, !dbg !130
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !131
  store i32 0, i32* %arrayidx5, align 4, !dbg !132
  store i64 0, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !136
  %cmp = icmp ult i64 %2, 100, !dbg !138
  br i1 %cmp, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !142
  %4 = load i32, i32* %arrayidx6, align 4, !dbg !142
  %5 = load i32*, i32** %data, align 8, !dbg !143
  %6 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx7 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !143
  store i32 %4, i32* %arrayidx7, align 4, !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !147
  %inc = add i64 %7, 1, !dbg !147
  store i64 %inc, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !151
  %arrayidx8 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !151
  store i32 0, i32* %arrayidx8, align 4, !dbg !152
  %9 = load i32*, i32** %data, align 8, !dbg !153
  call void @printWLine(i32* %9), !dbg !154
  ret void, !dbg !155
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_12_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 27, column: 13, scope: !11)
!31 = !DILocation(line: 28, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!33 = !DILocation(line: 28, column: 8, scope: !11)
!34 = !DILocation(line: 32, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !12, line: 29, column: 5)
!36 = !DILocation(line: 32, column: 14, scope: !35)
!37 = !DILocation(line: 33, column: 9, scope: !35)
!38 = !DILocation(line: 33, column: 17, scope: !35)
!39 = !DILocation(line: 34, column: 5, scope: !35)
!40 = !DILocation(line: 38, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !32, file: !12, line: 36, column: 5)
!42 = !DILocation(line: 38, column: 14, scope: !41)
!43 = !DILocation(line: 39, column: 9, scope: !41)
!44 = !DILocation(line: 39, column: 17, scope: !41)
!45 = !DILocalVariable(name: "i", scope: !46, file: !12, line: 42, type: !47)
!46 = distinct !DILexicalBlock(scope: !11, file: !12, line: 41, column: 5)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !48)
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 42, column: 16, scope: !46)
!50 = !DILocalVariable(name: "source", scope: !46, file: !12, line: 43, type: !27)
!51 = !DILocation(line: 43, column: 17, scope: !46)
!52 = !DILocation(line: 44, column: 17, scope: !46)
!53 = !DILocation(line: 44, column: 9, scope: !46)
!54 = !DILocation(line: 45, column: 9, scope: !46)
!55 = !DILocation(line: 45, column: 23, scope: !46)
!56 = !DILocation(line: 47, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !46, file: !12, line: 47, column: 9)
!58 = !DILocation(line: 47, column: 14, scope: !57)
!59 = !DILocation(line: 47, column: 21, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !12, line: 47, column: 9)
!61 = !DILocation(line: 47, column: 23, scope: !60)
!62 = !DILocation(line: 47, column: 9, scope: !57)
!63 = !DILocation(line: 49, column: 30, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !12, line: 48, column: 9)
!65 = !DILocation(line: 49, column: 23, scope: !64)
!66 = !DILocation(line: 49, column: 13, scope: !64)
!67 = !DILocation(line: 49, column: 18, scope: !64)
!68 = !DILocation(line: 49, column: 21, scope: !64)
!69 = !DILocation(line: 50, column: 9, scope: !64)
!70 = !DILocation(line: 47, column: 31, scope: !60)
!71 = !DILocation(line: 47, column: 9, scope: !60)
!72 = distinct !{!72, !62, !73, !74}
!73 = !DILocation(line: 50, column: 9, scope: !57)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 51, column: 9, scope: !46)
!76 = !DILocation(line: 51, column: 21, scope: !46)
!77 = !DILocation(line: 52, column: 20, scope: !46)
!78 = !DILocation(line: 52, column: 9, scope: !46)
!79 = !DILocation(line: 54, column: 1, scope: !11)
!80 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_12_good", scope: !12, file: !12, line: 94, type: !13, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocation(line: 96, column: 5, scope: !80)
!82 = !DILocation(line: 97, column: 1, scope: !80)
!83 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 109, type: !84, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!19, !19, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !12, line: 109, type: !19)
!90 = !DILocation(line: 109, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !12, line: 109, type: !86)
!92 = !DILocation(line: 109, column: 27, scope: !83)
!93 = !DILocation(line: 112, column: 22, scope: !83)
!94 = !DILocation(line: 112, column: 12, scope: !83)
!95 = !DILocation(line: 112, column: 5, scope: !83)
!96 = !DILocation(line: 114, column: 5, scope: !83)
!97 = !DILocation(line: 115, column: 5, scope: !83)
!98 = !DILocation(line: 116, column: 5, scope: !83)
!99 = !DILocation(line: 119, column: 5, scope: !83)
!100 = !DILocation(line: 120, column: 5, scope: !83)
!101 = !DILocation(line: 121, column: 5, scope: !83)
!102 = !DILocation(line: 123, column: 5, scope: !83)
!103 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 62, type: !13, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !12, line: 64, type: !16)
!105 = !DILocation(line: 64, column: 15, scope: !103)
!106 = !DILocalVariable(name: "dataBadBuffer", scope: !103, file: !12, line: 65, type: !22)
!107 = !DILocation(line: 65, column: 13, scope: !103)
!108 = !DILocalVariable(name: "dataGoodBuffer", scope: !103, file: !12, line: 66, type: !27)
!109 = !DILocation(line: 66, column: 13, scope: !103)
!110 = !DILocation(line: 67, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !103, file: !12, line: 67, column: 8)
!112 = !DILocation(line: 67, column: 8, scope: !103)
!113 = !DILocation(line: 70, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !12, line: 68, column: 5)
!115 = !DILocation(line: 70, column: 14, scope: !114)
!116 = !DILocation(line: 71, column: 9, scope: !114)
!117 = !DILocation(line: 71, column: 17, scope: !114)
!118 = !DILocation(line: 72, column: 5, scope: !114)
!119 = !DILocation(line: 76, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !111, file: !12, line: 74, column: 5)
!121 = !DILocation(line: 76, column: 14, scope: !120)
!122 = !DILocation(line: 77, column: 9, scope: !120)
!123 = !DILocation(line: 77, column: 17, scope: !120)
!124 = !DILocalVariable(name: "i", scope: !125, file: !12, line: 80, type: !47)
!125 = distinct !DILexicalBlock(scope: !103, file: !12, line: 79, column: 5)
!126 = !DILocation(line: 80, column: 16, scope: !125)
!127 = !DILocalVariable(name: "source", scope: !125, file: !12, line: 81, type: !27)
!128 = !DILocation(line: 81, column: 17, scope: !125)
!129 = !DILocation(line: 82, column: 17, scope: !125)
!130 = !DILocation(line: 82, column: 9, scope: !125)
!131 = !DILocation(line: 83, column: 9, scope: !125)
!132 = !DILocation(line: 83, column: 23, scope: !125)
!133 = !DILocation(line: 85, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !125, file: !12, line: 85, column: 9)
!135 = !DILocation(line: 85, column: 14, scope: !134)
!136 = !DILocation(line: 85, column: 21, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !12, line: 85, column: 9)
!138 = !DILocation(line: 85, column: 23, scope: !137)
!139 = !DILocation(line: 85, column: 9, scope: !134)
!140 = !DILocation(line: 87, column: 30, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !12, line: 86, column: 9)
!142 = !DILocation(line: 87, column: 23, scope: !141)
!143 = !DILocation(line: 87, column: 13, scope: !141)
!144 = !DILocation(line: 87, column: 18, scope: !141)
!145 = !DILocation(line: 87, column: 21, scope: !141)
!146 = !DILocation(line: 88, column: 9, scope: !141)
!147 = !DILocation(line: 85, column: 31, scope: !137)
!148 = !DILocation(line: 85, column: 9, scope: !137)
!149 = distinct !{!149, !139, !150, !74}
!150 = !DILocation(line: 88, column: 9, scope: !134)
!151 = !DILocation(line: 89, column: 9, scope: !125)
!152 = !DILocation(line: 89, column: 21, scope: !125)
!153 = !DILocation(line: 90, column: 20, scope: !125)
!154 = !DILocation(line: 90, column: 9, scope: !125)
!155 = !DILocation(line: 92, column: 1, scope: !103)
