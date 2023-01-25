; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_15_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 200, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 400, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !29
  store i32* %4, i32** %data, align 8, !dbg !30
  %5 = load i32*, i32** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !42
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !43
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !44
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !45
  store i32 0, i32* %arrayidx1, align 4, !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !50
  %cmp = icmp ult i64 %6, 100, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !56
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !56
  %9 = load i32*, i32** %data, align 8, !dbg !57
  %10 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !57
  store i32 %8, i32* %arrayidx3, align 4, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %11, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !66
  %arrayidx4 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !66
  store i32 0, i32* %arrayidx4, align 4, !dbg !67
  %13 = load i32*, i32** %data, align 8, !dbg !68
  call void @printWLine(i32* %13), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_15_good() #0 !dbg !71 {
entry:
  call void @goodG2B1(), !dbg !72
  call void @goodG2B2(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #4, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #4, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_15_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_15_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !95 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %0 = alloca i8, i64 200, align 16, !dbg !100
  %1 = bitcast i8* %0 to i32*, !dbg !101
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %2 = alloca i8, i64 400, align 16, !dbg !104
  %3 = bitcast i8* %2 to i32*, !dbg !105
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !103
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !106
  store i32* %4, i32** %data, align 8, !dbg !107
  %5 = load i32*, i32** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !108
  store i32 0, i32* %arrayidx, align 4, !dbg !109
  call void @llvm.dbg.declare(metadata i64* %i, metadata !110, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !113, metadata !DIExpression()), !dbg !114
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !115
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !116
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !117
  store i32 0, i32* %arrayidx1, align 4, !dbg !118
  store i64 0, i64* %i, align 8, !dbg !119
  br label %for.cond, !dbg !121

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !122
  %cmp = icmp ult i64 %6, 100, !dbg !124
  br i1 %cmp, label %for.body, label %for.end, !dbg !125

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !126
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !128
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !128
  %9 = load i32*, i32** %data, align 8, !dbg !129
  %10 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !129
  store i32 %8, i32* %arrayidx3, align 4, !dbg !131
  br label %for.inc, !dbg !132

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !133
  %inc = add i64 %11, 1, !dbg !133
  store i64 %inc, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !134, !llvm.loop !135

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !137
  %arrayidx4 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !137
  store i32 0, i32* %arrayidx4, align 4, !dbg !138
  %13 = load i32*, i32** %data, align 8, !dbg !139
  call void @printWLine(i32* %13), !dbg !140
  ret void, !dbg !141
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !142 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !143, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !145, metadata !DIExpression()), !dbg !146
  %0 = alloca i8, i64 200, align 16, !dbg !147
  %1 = bitcast i8* %0 to i32*, !dbg !148
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !146
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !149, metadata !DIExpression()), !dbg !150
  %2 = alloca i8, i64 400, align 16, !dbg !151
  %3 = bitcast i8* %2 to i32*, !dbg !152
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !150
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !153
  store i32* %4, i32** %data, align 8, !dbg !154
  %5 = load i32*, i32** %data, align 8, !dbg !155
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !155
  store i32 0, i32* %arrayidx, align 4, !dbg !156
  call void @llvm.dbg.declare(metadata i64* %i, metadata !157, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !160, metadata !DIExpression()), !dbg !161
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !162
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !163
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !164
  store i32 0, i32* %arrayidx1, align 4, !dbg !165
  store i64 0, i64* %i, align 8, !dbg !166
  br label %for.cond, !dbg !168

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !169
  %cmp = icmp ult i64 %6, 100, !dbg !171
  br i1 %cmp, label %for.body, label %for.end, !dbg !172

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !173
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !175
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !175
  %9 = load i32*, i32** %data, align 8, !dbg !176
  %10 = load i64, i64* %i, align 8, !dbg !177
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !176
  store i32 %8, i32* %arrayidx3, align 4, !dbg !178
  br label %for.inc, !dbg !179

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !180
  %inc = add i64 %11, 1, !dbg !180
  store i64 %inc, i64* %i, align 8, !dbg !180
  br label %for.cond, !dbg !181, !llvm.loop !182

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !184
  %arrayidx4 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !184
  store i32 0, i32* %arrayidx4, align 4, !dbg !185
  %13 = load i32*, i32** %data, align 8, !dbg !186
  call void @printWLine(i32* %13), !dbg !187
  ret void, !dbg !188
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_15_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 42, scope: !15)
!24 = !DILocation(line: 26, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 27, type: !4)
!26 = !DILocation(line: 27, column: 15, scope: !15)
!27 = !DILocation(line: 27, column: 43, scope: !15)
!28 = !DILocation(line: 27, column: 32, scope: !15)
!29 = !DILocation(line: 33, column: 16, scope: !15)
!30 = !DILocation(line: 33, column: 14, scope: !15)
!31 = !DILocation(line: 34, column: 9, scope: !15)
!32 = !DILocation(line: 34, column: 17, scope: !15)
!33 = !DILocalVariable(name: "i", scope: !34, file: !16, line: 42, type: !35)
!34 = distinct !DILexicalBlock(scope: !15, file: !16, line: 41, column: 5)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !36)
!36 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 42, column: 16, scope: !34)
!38 = !DILocalVariable(name: "source", scope: !34, file: !16, line: 43, type: !39)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 43, column: 17, scope: !34)
!43 = !DILocation(line: 44, column: 17, scope: !34)
!44 = !DILocation(line: 44, column: 9, scope: !34)
!45 = !DILocation(line: 45, column: 9, scope: !34)
!46 = !DILocation(line: 45, column: 23, scope: !34)
!47 = !DILocation(line: 47, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !34, file: !16, line: 47, column: 9)
!49 = !DILocation(line: 47, column: 14, scope: !48)
!50 = !DILocation(line: 47, column: 21, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !16, line: 47, column: 9)
!52 = !DILocation(line: 47, column: 23, scope: !51)
!53 = !DILocation(line: 47, column: 9, scope: !48)
!54 = !DILocation(line: 49, column: 30, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !16, line: 48, column: 9)
!56 = !DILocation(line: 49, column: 23, scope: !55)
!57 = !DILocation(line: 49, column: 13, scope: !55)
!58 = !DILocation(line: 49, column: 18, scope: !55)
!59 = !DILocation(line: 49, column: 21, scope: !55)
!60 = !DILocation(line: 50, column: 9, scope: !55)
!61 = !DILocation(line: 47, column: 31, scope: !51)
!62 = !DILocation(line: 47, column: 9, scope: !51)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 50, column: 9, scope: !48)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 51, column: 9, scope: !34)
!67 = !DILocation(line: 51, column: 21, scope: !34)
!68 = !DILocation(line: 52, column: 20, scope: !34)
!69 = !DILocation(line: 52, column: 9, scope: !34)
!70 = !DILocation(line: 54, column: 1, scope: !15)
!71 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_15_good", scope: !16, file: !16, line: 126, type: !17, scopeLine: 127, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 128, column: 5, scope: !71)
!73 = !DILocation(line: 129, column: 5, scope: !71)
!74 = !DILocation(line: 130, column: 1, scope: !71)
!75 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 142, type: !76, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!7, !7, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !16, line: 142, type: !7)
!82 = !DILocation(line: 142, column: 14, scope: !75)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !16, line: 142, type: !78)
!84 = !DILocation(line: 142, column: 27, scope: !75)
!85 = !DILocation(line: 145, column: 22, scope: !75)
!86 = !DILocation(line: 145, column: 12, scope: !75)
!87 = !DILocation(line: 145, column: 5, scope: !75)
!88 = !DILocation(line: 147, column: 5, scope: !75)
!89 = !DILocation(line: 148, column: 5, scope: !75)
!90 = !DILocation(line: 149, column: 5, scope: !75)
!91 = !DILocation(line: 152, column: 5, scope: !75)
!92 = !DILocation(line: 153, column: 5, scope: !75)
!93 = !DILocation(line: 154, column: 5, scope: !75)
!94 = !DILocation(line: 156, column: 5, scope: !75)
!95 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 61, type: !17, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !16, line: 63, type: !4)
!97 = !DILocation(line: 63, column: 15, scope: !95)
!98 = !DILocalVariable(name: "dataBadBuffer", scope: !95, file: !16, line: 64, type: !4)
!99 = !DILocation(line: 64, column: 15, scope: !95)
!100 = !DILocation(line: 64, column: 42, scope: !95)
!101 = !DILocation(line: 64, column: 31, scope: !95)
!102 = !DILocalVariable(name: "dataGoodBuffer", scope: !95, file: !16, line: 65, type: !4)
!103 = !DILocation(line: 65, column: 15, scope: !95)
!104 = !DILocation(line: 65, column: 43, scope: !95)
!105 = !DILocation(line: 65, column: 32, scope: !95)
!106 = !DILocation(line: 74, column: 16, scope: !95)
!107 = !DILocation(line: 74, column: 14, scope: !95)
!108 = !DILocation(line: 75, column: 9, scope: !95)
!109 = !DILocation(line: 75, column: 17, scope: !95)
!110 = !DILocalVariable(name: "i", scope: !111, file: !16, line: 79, type: !35)
!111 = distinct !DILexicalBlock(scope: !95, file: !16, line: 78, column: 5)
!112 = !DILocation(line: 79, column: 16, scope: !111)
!113 = !DILocalVariable(name: "source", scope: !111, file: !16, line: 80, type: !39)
!114 = !DILocation(line: 80, column: 17, scope: !111)
!115 = !DILocation(line: 81, column: 17, scope: !111)
!116 = !DILocation(line: 81, column: 9, scope: !111)
!117 = !DILocation(line: 82, column: 9, scope: !111)
!118 = !DILocation(line: 82, column: 23, scope: !111)
!119 = !DILocation(line: 84, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !111, file: !16, line: 84, column: 9)
!121 = !DILocation(line: 84, column: 14, scope: !120)
!122 = !DILocation(line: 84, column: 21, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !16, line: 84, column: 9)
!124 = !DILocation(line: 84, column: 23, scope: !123)
!125 = !DILocation(line: 84, column: 9, scope: !120)
!126 = !DILocation(line: 86, column: 30, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !16, line: 85, column: 9)
!128 = !DILocation(line: 86, column: 23, scope: !127)
!129 = !DILocation(line: 86, column: 13, scope: !127)
!130 = !DILocation(line: 86, column: 18, scope: !127)
!131 = !DILocation(line: 86, column: 21, scope: !127)
!132 = !DILocation(line: 87, column: 9, scope: !127)
!133 = !DILocation(line: 84, column: 31, scope: !123)
!134 = !DILocation(line: 84, column: 9, scope: !123)
!135 = distinct !{!135, !125, !136, !65}
!136 = !DILocation(line: 87, column: 9, scope: !120)
!137 = !DILocation(line: 88, column: 9, scope: !111)
!138 = !DILocation(line: 88, column: 21, scope: !111)
!139 = !DILocation(line: 89, column: 20, scope: !111)
!140 = !DILocation(line: 89, column: 9, scope: !111)
!141 = !DILocation(line: 91, column: 1, scope: !95)
!142 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 94, type: !17, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!143 = !DILocalVariable(name: "data", scope: !142, file: !16, line: 96, type: !4)
!144 = !DILocation(line: 96, column: 15, scope: !142)
!145 = !DILocalVariable(name: "dataBadBuffer", scope: !142, file: !16, line: 97, type: !4)
!146 = !DILocation(line: 97, column: 15, scope: !142)
!147 = !DILocation(line: 97, column: 42, scope: !142)
!148 = !DILocation(line: 97, column: 31, scope: !142)
!149 = !DILocalVariable(name: "dataGoodBuffer", scope: !142, file: !16, line: 98, type: !4)
!150 = !DILocation(line: 98, column: 15, scope: !142)
!151 = !DILocation(line: 98, column: 43, scope: !142)
!152 = !DILocation(line: 98, column: 32, scope: !142)
!153 = !DILocation(line: 103, column: 16, scope: !142)
!154 = !DILocation(line: 103, column: 14, scope: !142)
!155 = !DILocation(line: 104, column: 9, scope: !142)
!156 = !DILocation(line: 104, column: 17, scope: !142)
!157 = !DILocalVariable(name: "i", scope: !158, file: !16, line: 112, type: !35)
!158 = distinct !DILexicalBlock(scope: !142, file: !16, line: 111, column: 5)
!159 = !DILocation(line: 112, column: 16, scope: !158)
!160 = !DILocalVariable(name: "source", scope: !158, file: !16, line: 113, type: !39)
!161 = !DILocation(line: 113, column: 17, scope: !158)
!162 = !DILocation(line: 114, column: 17, scope: !158)
!163 = !DILocation(line: 114, column: 9, scope: !158)
!164 = !DILocation(line: 115, column: 9, scope: !158)
!165 = !DILocation(line: 115, column: 23, scope: !158)
!166 = !DILocation(line: 117, column: 16, scope: !167)
!167 = distinct !DILexicalBlock(scope: !158, file: !16, line: 117, column: 9)
!168 = !DILocation(line: 117, column: 14, scope: !167)
!169 = !DILocation(line: 117, column: 21, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !16, line: 117, column: 9)
!171 = !DILocation(line: 117, column: 23, scope: !170)
!172 = !DILocation(line: 117, column: 9, scope: !167)
!173 = !DILocation(line: 119, column: 30, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !16, line: 118, column: 9)
!175 = !DILocation(line: 119, column: 23, scope: !174)
!176 = !DILocation(line: 119, column: 13, scope: !174)
!177 = !DILocation(line: 119, column: 18, scope: !174)
!178 = !DILocation(line: 119, column: 21, scope: !174)
!179 = !DILocation(line: 120, column: 9, scope: !174)
!180 = !DILocation(line: 117, column: 31, scope: !170)
!181 = !DILocation(line: 117, column: 9, scope: !170)
!182 = distinct !{!182, !172, !183, !65}
!183 = !DILocation(line: 120, column: 9, scope: !167)
!184 = !DILocation(line: 121, column: 9, scope: !158)
!185 = !DILocation(line: 121, column: 21, scope: !158)
!186 = !DILocation(line: 122, column: 20, scope: !158)
!187 = !DILocation(line: 122, column: 9, scope: !158)
!188 = !DILocation(line: 124, column: 1, scope: !142)
