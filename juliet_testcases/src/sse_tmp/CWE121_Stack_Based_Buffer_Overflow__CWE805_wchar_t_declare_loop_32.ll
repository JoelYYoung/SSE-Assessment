; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !36, metadata !DIExpression()), !dbg !38
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !39
  %1 = load i32*, i32** %0, align 8, !dbg !40
  store i32* %1, i32** %data1, align 8, !dbg !38
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !41
  store i32* %arraydecay, i32** %data1, align 8, !dbg !42
  %2 = load i32*, i32** %data1, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !44
  %3 = load i32*, i32** %data1, align 8, !dbg !45
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !46
  store i32* %3, i32** %4, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !48, metadata !DIExpression()), !dbg !50
  %5 = load i32**, i32*** %dataPtr2, align 8, !dbg !51
  %6 = load i32*, i32** %5, align 8, !dbg !52
  store i32* %6, i32** %data2, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata i64* %i, metadata !53, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !58, metadata !DIExpression()), !dbg !59
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !60
  %call = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #4, !dbg !61
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !62
  store i32 0, i32* %arrayidx4, align 4, !dbg !63
  store i64 0, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !66

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !67
  %cmp = icmp ult i64 %7, 100, !dbg !69
  br i1 %cmp, label %for.body, label %for.end, !dbg !70

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !73
  %9 = load i32, i32* %arrayidx5, align 4, !dbg !73
  %10 = load i32*, i32** %data2, align 8, !dbg !74
  %11 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx6 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !74
  store i32 %9, i32* %arrayidx6, align 4, !dbg !76
  br label %for.inc, !dbg !77

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !78
  %inc = add i64 %12, 1, !dbg !78
  store i64 %inc, i64* %i, align 8, !dbg !78
  br label %for.cond, !dbg !79, !llvm.loop !80

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data2, align 8, !dbg !83
  %arrayidx7 = getelementptr inbounds i32, i32* %13, i64 99, !dbg !83
  store i32 0, i32* %arrayidx7, align 4, !dbg !84
  %14 = load i32*, i32** %data2, align 8, !dbg !85
  call void @printWLine(i32* %14), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_32_good() #0 !dbg !88 {
entry:
  call void @goodG2B(), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !91 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !97, metadata !DIExpression()), !dbg !98
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call i64 @time(i64* null) #4, !dbg !101
  %conv = trunc i64 %call to i32, !dbg !102
  call void @srand(i32 %conv) #4, !dbg !103
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !104
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_32_good(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_32_bad(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  ret i32 0, !dbg !110
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !111 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !114, metadata !DIExpression()), !dbg !115
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !116, metadata !DIExpression()), !dbg !117
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !122, metadata !DIExpression()), !dbg !124
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !125
  %1 = load i32*, i32** %0, align 8, !dbg !126
  store i32* %1, i32** %data1, align 8, !dbg !124
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !127
  store i32* %arraydecay, i32** %data1, align 8, !dbg !128
  %2 = load i32*, i32** %data1, align 8, !dbg !129
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !129
  store i32 0, i32* %arrayidx, align 4, !dbg !130
  %3 = load i32*, i32** %data1, align 8, !dbg !131
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !132
  store i32* %3, i32** %4, align 8, !dbg !133
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !134, metadata !DIExpression()), !dbg !136
  %5 = load i32**, i32*** %dataPtr2, align 8, !dbg !137
  %6 = load i32*, i32** %5, align 8, !dbg !138
  store i32* %6, i32** %data2, align 8, !dbg !136
  call void @llvm.dbg.declare(metadata i64* %i, metadata !139, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !142, metadata !DIExpression()), !dbg !143
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !144
  %call = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #4, !dbg !145
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !146
  store i32 0, i32* %arrayidx4, align 4, !dbg !147
  store i64 0, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !150

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !151
  %cmp = icmp ult i64 %7, 100, !dbg !153
  br i1 %cmp, label %for.body, label %for.end, !dbg !154

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !157
  %9 = load i32, i32* %arrayidx5, align 4, !dbg !157
  %10 = load i32*, i32** %data2, align 8, !dbg !158
  %11 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx6 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !158
  store i32 %9, i32* %arrayidx6, align 4, !dbg !160
  br label %for.inc, !dbg !161

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !162
  %inc = add i64 %12, 1, !dbg !162
  store i64 %inc, i64* %i, align 8, !dbg !162
  br label %for.cond, !dbg !163, !llvm.loop !164

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data2, align 8, !dbg !166
  %arrayidx7 = getelementptr inbounds i32, i32* %13, i64 99, !dbg !166
  store i32 0, i32* %arrayidx7, align 4, !dbg !167
  %14 = load i32*, i32** %data2, align 8, !dbg !168
  call void @printWLine(i32* %14), !dbg !169
  ret void, !dbg !170
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_32.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_32_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_32.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 26, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!23 = !DILocation(line: 26, column: 16, scope: !11)
!24 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 27, type: !22)
!25 = !DILocation(line: 27, column: 16, scope: !11)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 28, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 50)
!30 = !DILocation(line: 28, column: 13, scope: !11)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 29, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 29, column: 13, scope: !11)
!36 = !DILocalVariable(name: "data", scope: !37, file: !12, line: 31, type: !16)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 5)
!38 = !DILocation(line: 31, column: 19, scope: !37)
!39 = !DILocation(line: 31, column: 27, scope: !37)
!40 = !DILocation(line: 31, column: 26, scope: !37)
!41 = !DILocation(line: 34, column: 16, scope: !37)
!42 = !DILocation(line: 34, column: 14, scope: !37)
!43 = !DILocation(line: 35, column: 9, scope: !37)
!44 = !DILocation(line: 35, column: 17, scope: !37)
!45 = !DILocation(line: 36, column: 21, scope: !37)
!46 = !DILocation(line: 36, column: 10, scope: !37)
!47 = !DILocation(line: 36, column: 19, scope: !37)
!48 = !DILocalVariable(name: "data", scope: !49, file: !12, line: 39, type: !16)
!49 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 5)
!50 = !DILocation(line: 39, column: 19, scope: !49)
!51 = !DILocation(line: 39, column: 27, scope: !49)
!52 = !DILocation(line: 39, column: 26, scope: !49)
!53 = !DILocalVariable(name: "i", scope: !54, file: !12, line: 41, type: !55)
!54 = distinct !DILexicalBlock(scope: !49, file: !12, line: 40, column: 9)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !56)
!56 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!57 = !DILocation(line: 41, column: 20, scope: !54)
!58 = !DILocalVariable(name: "source", scope: !54, file: !12, line: 42, type: !32)
!59 = !DILocation(line: 42, column: 21, scope: !54)
!60 = !DILocation(line: 43, column: 21, scope: !54)
!61 = !DILocation(line: 43, column: 13, scope: !54)
!62 = !DILocation(line: 44, column: 13, scope: !54)
!63 = !DILocation(line: 44, column: 27, scope: !54)
!64 = !DILocation(line: 46, column: 20, scope: !65)
!65 = distinct !DILexicalBlock(scope: !54, file: !12, line: 46, column: 13)
!66 = !DILocation(line: 46, column: 18, scope: !65)
!67 = !DILocation(line: 46, column: 25, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !12, line: 46, column: 13)
!69 = !DILocation(line: 46, column: 27, scope: !68)
!70 = !DILocation(line: 46, column: 13, scope: !65)
!71 = !DILocation(line: 48, column: 34, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !12, line: 47, column: 13)
!73 = !DILocation(line: 48, column: 27, scope: !72)
!74 = !DILocation(line: 48, column: 17, scope: !72)
!75 = !DILocation(line: 48, column: 22, scope: !72)
!76 = !DILocation(line: 48, column: 25, scope: !72)
!77 = !DILocation(line: 49, column: 13, scope: !72)
!78 = !DILocation(line: 46, column: 35, scope: !68)
!79 = !DILocation(line: 46, column: 13, scope: !68)
!80 = distinct !{!80, !70, !81, !82}
!81 = !DILocation(line: 49, column: 13, scope: !65)
!82 = !{!"llvm.loop.mustprogress"}
!83 = !DILocation(line: 50, column: 13, scope: !54)
!84 = !DILocation(line: 50, column: 25, scope: !54)
!85 = !DILocation(line: 51, column: 24, scope: !54)
!86 = !DILocation(line: 51, column: 13, scope: !54)
!87 = !DILocation(line: 54, column: 1, scope: !11)
!88 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_32_good", scope: !12, file: !12, line: 93, type: !13, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocation(line: 95, column: 5, scope: !88)
!90 = !DILocation(line: 96, column: 1, scope: !88)
!91 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 107, type: !92, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DISubroutineType(types: !93)
!93 = !{!19, !19, !94}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!97 = !DILocalVariable(name: "argc", arg: 1, scope: !91, file: !12, line: 107, type: !19)
!98 = !DILocation(line: 107, column: 14, scope: !91)
!99 = !DILocalVariable(name: "argv", arg: 2, scope: !91, file: !12, line: 107, type: !94)
!100 = !DILocation(line: 107, column: 27, scope: !91)
!101 = !DILocation(line: 110, column: 22, scope: !91)
!102 = !DILocation(line: 110, column: 12, scope: !91)
!103 = !DILocation(line: 110, column: 5, scope: !91)
!104 = !DILocation(line: 112, column: 5, scope: !91)
!105 = !DILocation(line: 113, column: 5, scope: !91)
!106 = !DILocation(line: 114, column: 5, scope: !91)
!107 = !DILocation(line: 117, column: 5, scope: !91)
!108 = !DILocation(line: 118, column: 5, scope: !91)
!109 = !DILocation(line: 119, column: 5, scope: !91)
!110 = !DILocation(line: 121, column: 5, scope: !91)
!111 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", scope: !111, file: !12, line: 63, type: !16)
!113 = !DILocation(line: 63, column: 15, scope: !111)
!114 = !DILocalVariable(name: "dataPtr1", scope: !111, file: !12, line: 64, type: !22)
!115 = !DILocation(line: 64, column: 16, scope: !111)
!116 = !DILocalVariable(name: "dataPtr2", scope: !111, file: !12, line: 65, type: !22)
!117 = !DILocation(line: 65, column: 16, scope: !111)
!118 = !DILocalVariable(name: "dataBadBuffer", scope: !111, file: !12, line: 66, type: !27)
!119 = !DILocation(line: 66, column: 13, scope: !111)
!120 = !DILocalVariable(name: "dataGoodBuffer", scope: !111, file: !12, line: 67, type: !32)
!121 = !DILocation(line: 67, column: 13, scope: !111)
!122 = !DILocalVariable(name: "data", scope: !123, file: !12, line: 69, type: !16)
!123 = distinct !DILexicalBlock(scope: !111, file: !12, line: 68, column: 5)
!124 = !DILocation(line: 69, column: 19, scope: !123)
!125 = !DILocation(line: 69, column: 27, scope: !123)
!126 = !DILocation(line: 69, column: 26, scope: !123)
!127 = !DILocation(line: 71, column: 16, scope: !123)
!128 = !DILocation(line: 71, column: 14, scope: !123)
!129 = !DILocation(line: 72, column: 9, scope: !123)
!130 = !DILocation(line: 72, column: 17, scope: !123)
!131 = !DILocation(line: 73, column: 21, scope: !123)
!132 = !DILocation(line: 73, column: 10, scope: !123)
!133 = !DILocation(line: 73, column: 19, scope: !123)
!134 = !DILocalVariable(name: "data", scope: !135, file: !12, line: 76, type: !16)
!135 = distinct !DILexicalBlock(scope: !111, file: !12, line: 75, column: 5)
!136 = !DILocation(line: 76, column: 19, scope: !135)
!137 = !DILocation(line: 76, column: 27, scope: !135)
!138 = !DILocation(line: 76, column: 26, scope: !135)
!139 = !DILocalVariable(name: "i", scope: !140, file: !12, line: 78, type: !55)
!140 = distinct !DILexicalBlock(scope: !135, file: !12, line: 77, column: 9)
!141 = !DILocation(line: 78, column: 20, scope: !140)
!142 = !DILocalVariable(name: "source", scope: !140, file: !12, line: 79, type: !32)
!143 = !DILocation(line: 79, column: 21, scope: !140)
!144 = !DILocation(line: 80, column: 21, scope: !140)
!145 = !DILocation(line: 80, column: 13, scope: !140)
!146 = !DILocation(line: 81, column: 13, scope: !140)
!147 = !DILocation(line: 81, column: 27, scope: !140)
!148 = !DILocation(line: 83, column: 20, scope: !149)
!149 = distinct !DILexicalBlock(scope: !140, file: !12, line: 83, column: 13)
!150 = !DILocation(line: 83, column: 18, scope: !149)
!151 = !DILocation(line: 83, column: 25, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !12, line: 83, column: 13)
!153 = !DILocation(line: 83, column: 27, scope: !152)
!154 = !DILocation(line: 83, column: 13, scope: !149)
!155 = !DILocation(line: 85, column: 34, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !12, line: 84, column: 13)
!157 = !DILocation(line: 85, column: 27, scope: !156)
!158 = !DILocation(line: 85, column: 17, scope: !156)
!159 = !DILocation(line: 85, column: 22, scope: !156)
!160 = !DILocation(line: 85, column: 25, scope: !156)
!161 = !DILocation(line: 86, column: 13, scope: !156)
!162 = !DILocation(line: 83, column: 35, scope: !152)
!163 = !DILocation(line: 83, column: 13, scope: !152)
!164 = distinct !{!164, !154, !165, !82}
!165 = !DILocation(line: 86, column: 13, scope: !149)
!166 = !DILocation(line: 87, column: 13, scope: !140)
!167 = !DILocation(line: 87, column: 25, scope: !140)
!168 = !DILocation(line: 88, column: 24, scope: !140)
!169 = !DILocation(line: 88, column: 13, scope: !140)
!170 = !DILocation(line: 91, column: 1, scope: !111)
