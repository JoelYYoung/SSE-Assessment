; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_15.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_15_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !26
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !27
  store i32 0, i32* %arrayidx, align 4, !dbg !28
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !29
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !30
  store i32* %add.ptr, i32** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i64* %i, metadata !32, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !37, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !42
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !43
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !44
  store i32 0, i32* %arrayidx2, align 4, !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !49
  %cmp = icmp ult i64 %5, 100, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %6, !dbg !55
  %7 = load i32, i32* %arrayidx3, align 4, !dbg !55
  %8 = load i32*, i32** %data, align 8, !dbg !56
  %9 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !56
  store i32 %7, i32* %arrayidx4, align 4, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %10, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !65
  %arrayidx5 = getelementptr inbounds i32, i32* %11, i64 99, !dbg !65
  store i32 0, i32* %arrayidx5, align 4, !dbg !66
  %12 = load i32*, i32** %data, align 8, !dbg !67
  call void @printWLine(i32* %12), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_15_good() #0 !dbg !70 {
entry:
  call void @goodG2B1(), !dbg !71
  call void @goodG2B2(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #4, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #4, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_15_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_15_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !94 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %0 = alloca i8, i64 400, align 16, !dbg !99
  %1 = bitcast i8* %0 to i32*, !dbg !100
  store i32* %1, i32** %dataBuffer, align 8, !dbg !98
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !101
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !102
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !103
  store i32 0, i32* %arrayidx, align 4, !dbg !104
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !105
  store i32* %4, i32** %data, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i64* %i, metadata !107, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !110, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !112
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !113
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !114
  store i32 0, i32* %arrayidx2, align 4, !dbg !115
  store i64 0, i64* %i, align 8, !dbg !116
  br label %for.cond, !dbg !118

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !119
  %cmp = icmp ult i64 %5, 100, !dbg !121
  br i1 %cmp, label %for.body, label %for.end, !dbg !122

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !123
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %6, !dbg !125
  %7 = load i32, i32* %arrayidx3, align 4, !dbg !125
  %8 = load i32*, i32** %data, align 8, !dbg !126
  %9 = load i64, i64* %i, align 8, !dbg !127
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !126
  store i32 %7, i32* %arrayidx4, align 4, !dbg !128
  br label %for.inc, !dbg !129

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !130
  %inc = add i64 %10, 1, !dbg !130
  store i64 %inc, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !131, !llvm.loop !132

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !134
  %arrayidx5 = getelementptr inbounds i32, i32* %11, i64 99, !dbg !134
  store i32 0, i32* %arrayidx5, align 4, !dbg !135
  %12 = load i32*, i32** %data, align 8, !dbg !136
  call void @printWLine(i32* %12), !dbg !137
  ret void, !dbg !138
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !139 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !142, metadata !DIExpression()), !dbg !143
  %0 = alloca i8, i64 400, align 16, !dbg !144
  %1 = bitcast i8* %0 to i32*, !dbg !145
  store i32* %1, i32** %dataBuffer, align 8, !dbg !143
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !146
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !147
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !148
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !148
  store i32 0, i32* %arrayidx, align 4, !dbg !149
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !150
  store i32* %4, i32** %data, align 8, !dbg !151
  call void @llvm.dbg.declare(metadata i64* %i, metadata !152, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !155, metadata !DIExpression()), !dbg !156
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !157
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !158
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !159
  store i32 0, i32* %arrayidx2, align 4, !dbg !160
  store i64 0, i64* %i, align 8, !dbg !161
  br label %for.cond, !dbg !163

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !164
  %cmp = icmp ult i64 %5, 100, !dbg !166
  br i1 %cmp, label %for.body, label %for.end, !dbg !167

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !168
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %6, !dbg !170
  %7 = load i32, i32* %arrayidx3, align 4, !dbg !170
  %8 = load i32*, i32** %data, align 8, !dbg !171
  %9 = load i64, i64* %i, align 8, !dbg !172
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !171
  store i32 %7, i32* %arrayidx4, align 4, !dbg !173
  br label %for.inc, !dbg !174

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !175
  %inc = add i64 %10, 1, !dbg !175
  store i64 %inc, i64* %i, align 8, !dbg !175
  br label %for.cond, !dbg !176, !llvm.loop !177

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !179
  %arrayidx5 = getelementptr inbounds i32, i32* %11, i64 99, !dbg !179
  store i32 0, i32* %arrayidx5, align 4, !dbg !180
  %12 = load i32*, i32** %data, align 8, !dbg !181
  call void @printWLine(i32* %12), !dbg !182
  ret void, !dbg !183
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_loop_15_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 39, scope: !15)
!24 = !DILocation(line: 26, column: 28, scope: !15)
!25 = !DILocation(line: 27, column: 13, scope: !15)
!26 = !DILocation(line: 27, column: 5, scope: !15)
!27 = !DILocation(line: 28, column: 5, scope: !15)
!28 = !DILocation(line: 28, column: 23, scope: !15)
!29 = !DILocation(line: 33, column: 16, scope: !15)
!30 = !DILocation(line: 33, column: 27, scope: !15)
!31 = !DILocation(line: 33, column: 14, scope: !15)
!32 = !DILocalVariable(name: "i", scope: !33, file: !16, line: 41, type: !34)
!33 = distinct !DILexicalBlock(scope: !15, file: !16, line: 40, column: 5)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !35)
!35 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!36 = !DILocation(line: 41, column: 16, scope: !33)
!37 = !DILocalVariable(name: "source", scope: !33, file: !16, line: 42, type: !38)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 42, column: 17, scope: !33)
!42 = !DILocation(line: 43, column: 17, scope: !33)
!43 = !DILocation(line: 43, column: 9, scope: !33)
!44 = !DILocation(line: 44, column: 9, scope: !33)
!45 = !DILocation(line: 44, column: 23, scope: !33)
!46 = !DILocation(line: 46, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !33, file: !16, line: 46, column: 9)
!48 = !DILocation(line: 46, column: 14, scope: !47)
!49 = !DILocation(line: 46, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !16, line: 46, column: 9)
!51 = !DILocation(line: 46, column: 23, scope: !50)
!52 = !DILocation(line: 46, column: 9, scope: !47)
!53 = !DILocation(line: 48, column: 30, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !16, line: 47, column: 9)
!55 = !DILocation(line: 48, column: 23, scope: !54)
!56 = !DILocation(line: 48, column: 13, scope: !54)
!57 = !DILocation(line: 48, column: 18, scope: !54)
!58 = !DILocation(line: 48, column: 21, scope: !54)
!59 = !DILocation(line: 49, column: 9, scope: !54)
!60 = !DILocation(line: 46, column: 31, scope: !50)
!61 = !DILocation(line: 46, column: 9, scope: !50)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 49, column: 9, scope: !47)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 51, column: 9, scope: !33)
!66 = !DILocation(line: 51, column: 21, scope: !33)
!67 = !DILocation(line: 52, column: 20, scope: !33)
!68 = !DILocation(line: 52, column: 9, scope: !33)
!69 = !DILocation(line: 54, column: 1, scope: !15)
!70 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_loop_15_good", scope: !16, file: !16, line: 128, type: !17, scopeLine: 129, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 130, column: 5, scope: !70)
!72 = !DILocation(line: 131, column: 5, scope: !70)
!73 = !DILocation(line: 132, column: 1, scope: !70)
!74 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 144, type: !75, scopeLine: 145, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!7, !7, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !16, line: 144, type: !7)
!81 = !DILocation(line: 144, column: 14, scope: !74)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !16, line: 144, type: !77)
!83 = !DILocation(line: 144, column: 27, scope: !74)
!84 = !DILocation(line: 147, column: 22, scope: !74)
!85 = !DILocation(line: 147, column: 12, scope: !74)
!86 = !DILocation(line: 147, column: 5, scope: !74)
!87 = !DILocation(line: 149, column: 5, scope: !74)
!88 = !DILocation(line: 150, column: 5, scope: !74)
!89 = !DILocation(line: 151, column: 5, scope: !74)
!90 = !DILocation(line: 154, column: 5, scope: !74)
!91 = !DILocation(line: 155, column: 5, scope: !74)
!92 = !DILocation(line: 156, column: 5, scope: !74)
!93 = !DILocation(line: 158, column: 5, scope: !74)
!94 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 61, type: !17, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !16, line: 63, type: !4)
!96 = !DILocation(line: 63, column: 15, scope: !94)
!97 = !DILocalVariable(name: "dataBuffer", scope: !94, file: !16, line: 64, type: !4)
!98 = !DILocation(line: 64, column: 15, scope: !94)
!99 = !DILocation(line: 64, column: 39, scope: !94)
!100 = !DILocation(line: 64, column: 28, scope: !94)
!101 = !DILocation(line: 65, column: 13, scope: !94)
!102 = !DILocation(line: 65, column: 5, scope: !94)
!103 = !DILocation(line: 66, column: 5, scope: !94)
!104 = !DILocation(line: 66, column: 23, scope: !94)
!105 = !DILocation(line: 75, column: 16, scope: !94)
!106 = !DILocation(line: 75, column: 14, scope: !94)
!107 = !DILocalVariable(name: "i", scope: !108, file: !16, line: 79, type: !34)
!108 = distinct !DILexicalBlock(scope: !94, file: !16, line: 78, column: 5)
!109 = !DILocation(line: 79, column: 16, scope: !108)
!110 = !DILocalVariable(name: "source", scope: !108, file: !16, line: 80, type: !38)
!111 = !DILocation(line: 80, column: 17, scope: !108)
!112 = !DILocation(line: 81, column: 17, scope: !108)
!113 = !DILocation(line: 81, column: 9, scope: !108)
!114 = !DILocation(line: 82, column: 9, scope: !108)
!115 = !DILocation(line: 82, column: 23, scope: !108)
!116 = !DILocation(line: 84, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !108, file: !16, line: 84, column: 9)
!118 = !DILocation(line: 84, column: 14, scope: !117)
!119 = !DILocation(line: 84, column: 21, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !16, line: 84, column: 9)
!121 = !DILocation(line: 84, column: 23, scope: !120)
!122 = !DILocation(line: 84, column: 9, scope: !117)
!123 = !DILocation(line: 86, column: 30, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !16, line: 85, column: 9)
!125 = !DILocation(line: 86, column: 23, scope: !124)
!126 = !DILocation(line: 86, column: 13, scope: !124)
!127 = !DILocation(line: 86, column: 18, scope: !124)
!128 = !DILocation(line: 86, column: 21, scope: !124)
!129 = !DILocation(line: 87, column: 9, scope: !124)
!130 = !DILocation(line: 84, column: 31, scope: !120)
!131 = !DILocation(line: 84, column: 9, scope: !120)
!132 = distinct !{!132, !122, !133, !64}
!133 = !DILocation(line: 87, column: 9, scope: !117)
!134 = !DILocation(line: 89, column: 9, scope: !108)
!135 = !DILocation(line: 89, column: 21, scope: !108)
!136 = !DILocation(line: 90, column: 20, scope: !108)
!137 = !DILocation(line: 90, column: 9, scope: !108)
!138 = !DILocation(line: 92, column: 1, scope: !94)
!139 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 95, type: !17, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!140 = !DILocalVariable(name: "data", scope: !139, file: !16, line: 97, type: !4)
!141 = !DILocation(line: 97, column: 15, scope: !139)
!142 = !DILocalVariable(name: "dataBuffer", scope: !139, file: !16, line: 98, type: !4)
!143 = !DILocation(line: 98, column: 15, scope: !139)
!144 = !DILocation(line: 98, column: 39, scope: !139)
!145 = !DILocation(line: 98, column: 28, scope: !139)
!146 = !DILocation(line: 99, column: 13, scope: !139)
!147 = !DILocation(line: 99, column: 5, scope: !139)
!148 = !DILocation(line: 100, column: 5, scope: !139)
!149 = !DILocation(line: 100, column: 23, scope: !139)
!150 = !DILocation(line: 105, column: 16, scope: !139)
!151 = !DILocation(line: 105, column: 14, scope: !139)
!152 = !DILocalVariable(name: "i", scope: !153, file: !16, line: 113, type: !34)
!153 = distinct !DILexicalBlock(scope: !139, file: !16, line: 112, column: 5)
!154 = !DILocation(line: 113, column: 16, scope: !153)
!155 = !DILocalVariable(name: "source", scope: !153, file: !16, line: 114, type: !38)
!156 = !DILocation(line: 114, column: 17, scope: !153)
!157 = !DILocation(line: 115, column: 17, scope: !153)
!158 = !DILocation(line: 115, column: 9, scope: !153)
!159 = !DILocation(line: 116, column: 9, scope: !153)
!160 = !DILocation(line: 116, column: 23, scope: !153)
!161 = !DILocation(line: 118, column: 16, scope: !162)
!162 = distinct !DILexicalBlock(scope: !153, file: !16, line: 118, column: 9)
!163 = !DILocation(line: 118, column: 14, scope: !162)
!164 = !DILocation(line: 118, column: 21, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !16, line: 118, column: 9)
!166 = !DILocation(line: 118, column: 23, scope: !165)
!167 = !DILocation(line: 118, column: 9, scope: !162)
!168 = !DILocation(line: 120, column: 30, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !16, line: 119, column: 9)
!170 = !DILocation(line: 120, column: 23, scope: !169)
!171 = !DILocation(line: 120, column: 13, scope: !169)
!172 = !DILocation(line: 120, column: 18, scope: !169)
!173 = !DILocation(line: 120, column: 21, scope: !169)
!174 = !DILocation(line: 121, column: 9, scope: !169)
!175 = !DILocation(line: 118, column: 31, scope: !165)
!176 = !DILocation(line: 118, column: 9, scope: !165)
!177 = distinct !{!177, !167, !178, !64}
!178 = !DILocation(line: 121, column: 9, scope: !162)
!179 = !DILocation(line: 123, column: 9, scope: !153)
!180 = !DILocation(line: 123, column: 21, scope: !153)
!181 = !DILocation(line: 124, column: 20, scope: !153)
!182 = !DILocation(line: 124, column: 9, scope: !153)
!183 = !DILocation(line: 126, column: 1, scope: !139)
