; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_32_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 200, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 400, align 16, !dbg !32
  %3 = bitcast i8* %2 to i32*, !dbg !33
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !34, metadata !DIExpression()), !dbg !36
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !37
  %5 = load i32*, i32** %4, align 8, !dbg !38
  store i32* %5, i32** %data1, align 8, !dbg !36
  %6 = load i32*, i32** %dataBadBuffer, align 8, !dbg !39
  store i32* %6, i32** %data1, align 8, !dbg !40
  %7 = load i32*, i32** %data1, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %8 = load i32*, i32** %data1, align 8, !dbg !43
  %9 = load i32**, i32*** %dataPtr1, align 8, !dbg !44
  store i32* %8, i32** %9, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !46, metadata !DIExpression()), !dbg !48
  %10 = load i32**, i32*** %dataPtr2, align 8, !dbg !49
  %11 = load i32*, i32** %10, align 8, !dbg !50
  store i32* %11, i32** %data2, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata i64* %i, metadata !51, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !56, metadata !DIExpression()), !dbg !60
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !61
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !62
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !63
  store i32 0, i32* %arrayidx3, align 4, !dbg !64
  store i64 0, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !67

for.cond:                                         ; preds = %for.inc, %entry
  %12 = load i64, i64* %i, align 8, !dbg !68
  %cmp = icmp ult i64 %12, 100, !dbg !70
  br i1 %cmp, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  %13 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %13, !dbg !74
  %14 = load i32, i32* %arrayidx4, align 4, !dbg !74
  %15 = load i32*, i32** %data2, align 8, !dbg !75
  %16 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx5 = getelementptr inbounds i32, i32* %15, i64 %16, !dbg !75
  store i32 %14, i32* %arrayidx5, align 4, !dbg !77
  br label %for.inc, !dbg !78

for.inc:                                          ; preds = %for.body
  %17 = load i64, i64* %i, align 8, !dbg !79
  %inc = add i64 %17, 1, !dbg !79
  store i64 %inc, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !80, !llvm.loop !81

for.end:                                          ; preds = %for.cond
  %18 = load i32*, i32** %data2, align 8, !dbg !84
  %arrayidx6 = getelementptr inbounds i32, i32* %18, i64 99, !dbg !84
  store i32 0, i32* %arrayidx6, align 4, !dbg !85
  %19 = load i32*, i32** %data2, align 8, !dbg !86
  call void @printWLine(i32* %19), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_32_good() #0 !dbg !89 {
entry:
  call void @goodG2B(), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !92 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !98, metadata !DIExpression()), !dbg !99
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !100, metadata !DIExpression()), !dbg !101
  %call = call i64 @time(i64* null) #4, !dbg !102
  %conv = trunc i64 %call to i32, !dbg !103
  call void @srand(i32 %conv) #4, !dbg !104
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !105
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_32_good(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_32_bad(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !112 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !115, metadata !DIExpression()), !dbg !116
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !117, metadata !DIExpression()), !dbg !118
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  %0 = alloca i8, i64 200, align 16, !dbg !121
  %1 = bitcast i8* %0 to i32*, !dbg !122
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !123, metadata !DIExpression()), !dbg !124
  %2 = alloca i8, i64 400, align 16, !dbg !125
  %3 = bitcast i8* %2 to i32*, !dbg !126
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !127, metadata !DIExpression()), !dbg !129
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !130
  %5 = load i32*, i32** %4, align 8, !dbg !131
  store i32* %5, i32** %data1, align 8, !dbg !129
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !132
  store i32* %6, i32** %data1, align 8, !dbg !133
  %7 = load i32*, i32** %data1, align 8, !dbg !134
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !134
  store i32 0, i32* %arrayidx, align 4, !dbg !135
  %8 = load i32*, i32** %data1, align 8, !dbg !136
  %9 = load i32**, i32*** %dataPtr1, align 8, !dbg !137
  store i32* %8, i32** %9, align 8, !dbg !138
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !139, metadata !DIExpression()), !dbg !141
  %10 = load i32**, i32*** %dataPtr2, align 8, !dbg !142
  %11 = load i32*, i32** %10, align 8, !dbg !143
  store i32* %11, i32** %data2, align 8, !dbg !141
  call void @llvm.dbg.declare(metadata i64* %i, metadata !144, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !147, metadata !DIExpression()), !dbg !148
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !149
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !150
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !151
  store i32 0, i32* %arrayidx3, align 4, !dbg !152
  store i64 0, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !155

for.cond:                                         ; preds = %for.inc, %entry
  %12 = load i64, i64* %i, align 8, !dbg !156
  %cmp = icmp ult i64 %12, 100, !dbg !158
  br i1 %cmp, label %for.body, label %for.end, !dbg !159

for.body:                                         ; preds = %for.cond
  %13 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %13, !dbg !162
  %14 = load i32, i32* %arrayidx4, align 4, !dbg !162
  %15 = load i32*, i32** %data2, align 8, !dbg !163
  %16 = load i64, i64* %i, align 8, !dbg !164
  %arrayidx5 = getelementptr inbounds i32, i32* %15, i64 %16, !dbg !163
  store i32 %14, i32* %arrayidx5, align 4, !dbg !165
  br label %for.inc, !dbg !166

for.inc:                                          ; preds = %for.body
  %17 = load i64, i64* %i, align 8, !dbg !167
  %inc = add i64 %17, 1, !dbg !167
  store i64 %inc, i64* %i, align 8, !dbg !167
  br label %for.cond, !dbg !168, !llvm.loop !169

for.end:                                          ; preds = %for.cond
  %18 = load i32*, i32** %data2, align 8, !dbg !171
  %arrayidx6 = getelementptr inbounds i32, i32* %18, i64 99, !dbg !171
  store i32 0, i32* %arrayidx6, align 4, !dbg !172
  %19 = load i32*, i32** %data2, align 8, !dbg !173
  call void @printWLine(i32* %19), !dbg !174
  ret void, !dbg !175
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_32.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_32_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_32.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataPtr1", scope: !15, file: !16, line: 26, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!23 = !DILocation(line: 26, column: 16, scope: !15)
!24 = !DILocalVariable(name: "dataPtr2", scope: !15, file: !16, line: 27, type: !22)
!25 = !DILocation(line: 27, column: 16, scope: !15)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 28, type: !4)
!27 = !DILocation(line: 28, column: 15, scope: !15)
!28 = !DILocation(line: 28, column: 42, scope: !15)
!29 = !DILocation(line: 28, column: 31, scope: !15)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 29, type: !4)
!31 = !DILocation(line: 29, column: 15, scope: !15)
!32 = !DILocation(line: 29, column: 43, scope: !15)
!33 = !DILocation(line: 29, column: 32, scope: !15)
!34 = !DILocalVariable(name: "data", scope: !35, file: !16, line: 31, type: !4)
!35 = distinct !DILexicalBlock(scope: !15, file: !16, line: 30, column: 5)
!36 = !DILocation(line: 31, column: 19, scope: !35)
!37 = !DILocation(line: 31, column: 27, scope: !35)
!38 = !DILocation(line: 31, column: 26, scope: !35)
!39 = !DILocation(line: 34, column: 16, scope: !35)
!40 = !DILocation(line: 34, column: 14, scope: !35)
!41 = !DILocation(line: 35, column: 9, scope: !35)
!42 = !DILocation(line: 35, column: 17, scope: !35)
!43 = !DILocation(line: 36, column: 21, scope: !35)
!44 = !DILocation(line: 36, column: 10, scope: !35)
!45 = !DILocation(line: 36, column: 19, scope: !35)
!46 = !DILocalVariable(name: "data", scope: !47, file: !16, line: 39, type: !4)
!47 = distinct !DILexicalBlock(scope: !15, file: !16, line: 38, column: 5)
!48 = !DILocation(line: 39, column: 19, scope: !47)
!49 = !DILocation(line: 39, column: 27, scope: !47)
!50 = !DILocation(line: 39, column: 26, scope: !47)
!51 = !DILocalVariable(name: "i", scope: !52, file: !16, line: 41, type: !53)
!52 = distinct !DILexicalBlock(scope: !47, file: !16, line: 40, column: 9)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !54)
!54 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!55 = !DILocation(line: 41, column: 20, scope: !52)
!56 = !DILocalVariable(name: "source", scope: !52, file: !16, line: 42, type: !57)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !58)
!58 = !{!59}
!59 = !DISubrange(count: 100)
!60 = !DILocation(line: 42, column: 21, scope: !52)
!61 = !DILocation(line: 43, column: 21, scope: !52)
!62 = !DILocation(line: 43, column: 13, scope: !52)
!63 = !DILocation(line: 44, column: 13, scope: !52)
!64 = !DILocation(line: 44, column: 27, scope: !52)
!65 = !DILocation(line: 46, column: 20, scope: !66)
!66 = distinct !DILexicalBlock(scope: !52, file: !16, line: 46, column: 13)
!67 = !DILocation(line: 46, column: 18, scope: !66)
!68 = !DILocation(line: 46, column: 25, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !16, line: 46, column: 13)
!70 = !DILocation(line: 46, column: 27, scope: !69)
!71 = !DILocation(line: 46, column: 13, scope: !66)
!72 = !DILocation(line: 48, column: 34, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !16, line: 47, column: 13)
!74 = !DILocation(line: 48, column: 27, scope: !73)
!75 = !DILocation(line: 48, column: 17, scope: !73)
!76 = !DILocation(line: 48, column: 22, scope: !73)
!77 = !DILocation(line: 48, column: 25, scope: !73)
!78 = !DILocation(line: 49, column: 13, scope: !73)
!79 = !DILocation(line: 46, column: 35, scope: !69)
!80 = !DILocation(line: 46, column: 13, scope: !69)
!81 = distinct !{!81, !71, !82, !83}
!82 = !DILocation(line: 49, column: 13, scope: !66)
!83 = !{!"llvm.loop.mustprogress"}
!84 = !DILocation(line: 50, column: 13, scope: !52)
!85 = !DILocation(line: 50, column: 25, scope: !52)
!86 = !DILocation(line: 51, column: 24, scope: !52)
!87 = !DILocation(line: 51, column: 13, scope: !52)
!88 = !DILocation(line: 54, column: 1, scope: !15)
!89 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_32_good", scope: !16, file: !16, line: 93, type: !17, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocation(line: 95, column: 5, scope: !89)
!91 = !DILocation(line: 96, column: 1, scope: !89)
!92 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 107, type: !93, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DISubroutineType(types: !94)
!94 = !{!7, !7, !95}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !16, line: 107, type: !7)
!99 = !DILocation(line: 107, column: 14, scope: !92)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !16, line: 107, type: !95)
!101 = !DILocation(line: 107, column: 27, scope: !92)
!102 = !DILocation(line: 110, column: 22, scope: !92)
!103 = !DILocation(line: 110, column: 12, scope: !92)
!104 = !DILocation(line: 110, column: 5, scope: !92)
!105 = !DILocation(line: 112, column: 5, scope: !92)
!106 = !DILocation(line: 113, column: 5, scope: !92)
!107 = !DILocation(line: 114, column: 5, scope: !92)
!108 = !DILocation(line: 117, column: 5, scope: !92)
!109 = !DILocation(line: 118, column: 5, scope: !92)
!110 = !DILocation(line: 119, column: 5, scope: !92)
!111 = !DILocation(line: 121, column: 5, scope: !92)
!112 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 61, type: !17, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", scope: !112, file: !16, line: 63, type: !4)
!114 = !DILocation(line: 63, column: 15, scope: !112)
!115 = !DILocalVariable(name: "dataPtr1", scope: !112, file: !16, line: 64, type: !22)
!116 = !DILocation(line: 64, column: 16, scope: !112)
!117 = !DILocalVariable(name: "dataPtr2", scope: !112, file: !16, line: 65, type: !22)
!118 = !DILocation(line: 65, column: 16, scope: !112)
!119 = !DILocalVariable(name: "dataBadBuffer", scope: !112, file: !16, line: 66, type: !4)
!120 = !DILocation(line: 66, column: 15, scope: !112)
!121 = !DILocation(line: 66, column: 42, scope: !112)
!122 = !DILocation(line: 66, column: 31, scope: !112)
!123 = !DILocalVariable(name: "dataGoodBuffer", scope: !112, file: !16, line: 67, type: !4)
!124 = !DILocation(line: 67, column: 15, scope: !112)
!125 = !DILocation(line: 67, column: 43, scope: !112)
!126 = !DILocation(line: 67, column: 32, scope: !112)
!127 = !DILocalVariable(name: "data", scope: !128, file: !16, line: 69, type: !4)
!128 = distinct !DILexicalBlock(scope: !112, file: !16, line: 68, column: 5)
!129 = !DILocation(line: 69, column: 19, scope: !128)
!130 = !DILocation(line: 69, column: 27, scope: !128)
!131 = !DILocation(line: 69, column: 26, scope: !128)
!132 = !DILocation(line: 71, column: 16, scope: !128)
!133 = !DILocation(line: 71, column: 14, scope: !128)
!134 = !DILocation(line: 72, column: 9, scope: !128)
!135 = !DILocation(line: 72, column: 17, scope: !128)
!136 = !DILocation(line: 73, column: 21, scope: !128)
!137 = !DILocation(line: 73, column: 10, scope: !128)
!138 = !DILocation(line: 73, column: 19, scope: !128)
!139 = !DILocalVariable(name: "data", scope: !140, file: !16, line: 76, type: !4)
!140 = distinct !DILexicalBlock(scope: !112, file: !16, line: 75, column: 5)
!141 = !DILocation(line: 76, column: 19, scope: !140)
!142 = !DILocation(line: 76, column: 27, scope: !140)
!143 = !DILocation(line: 76, column: 26, scope: !140)
!144 = !DILocalVariable(name: "i", scope: !145, file: !16, line: 78, type: !53)
!145 = distinct !DILexicalBlock(scope: !140, file: !16, line: 77, column: 9)
!146 = !DILocation(line: 78, column: 20, scope: !145)
!147 = !DILocalVariable(name: "source", scope: !145, file: !16, line: 79, type: !57)
!148 = !DILocation(line: 79, column: 21, scope: !145)
!149 = !DILocation(line: 80, column: 21, scope: !145)
!150 = !DILocation(line: 80, column: 13, scope: !145)
!151 = !DILocation(line: 81, column: 13, scope: !145)
!152 = !DILocation(line: 81, column: 27, scope: !145)
!153 = !DILocation(line: 83, column: 20, scope: !154)
!154 = distinct !DILexicalBlock(scope: !145, file: !16, line: 83, column: 13)
!155 = !DILocation(line: 83, column: 18, scope: !154)
!156 = !DILocation(line: 83, column: 25, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !16, line: 83, column: 13)
!158 = !DILocation(line: 83, column: 27, scope: !157)
!159 = !DILocation(line: 83, column: 13, scope: !154)
!160 = !DILocation(line: 85, column: 34, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !16, line: 84, column: 13)
!162 = !DILocation(line: 85, column: 27, scope: !161)
!163 = !DILocation(line: 85, column: 17, scope: !161)
!164 = !DILocation(line: 85, column: 22, scope: !161)
!165 = !DILocation(line: 85, column: 25, scope: !161)
!166 = !DILocation(line: 86, column: 13, scope: !161)
!167 = !DILocation(line: 83, column: 35, scope: !157)
!168 = !DILocation(line: 83, column: 13, scope: !157)
!169 = distinct !{!169, !159, !170, !83}
!170 = !DILocation(line: 86, column: 13, scope: !154)
!171 = !DILocation(line: 87, column: 13, scope: !145)
!172 = !DILocation(line: 87, column: 25, scope: !145)
!173 = !DILocation(line: 88, column: 24, scope: !145)
!174 = !DILocation(line: 88, column: 13, scope: !145)
!175 = !DILocation(line: 91, column: 1, scope: !112)
