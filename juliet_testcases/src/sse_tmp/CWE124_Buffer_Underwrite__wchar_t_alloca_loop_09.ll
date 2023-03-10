; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_09.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_09_bad() #0 !dbg !15 {
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
  %4 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !29
  %tobool = icmp ne i32 %4, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !34
  store i32* %add.ptr, i32** %data, align 8, !dbg !35
  br label %if.end, !dbg !36

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !42, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !47
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !48
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !49
  store i32 0, i32* %arrayidx2, align 4, !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !54
  %cmp = icmp ult i64 %6, 100, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !60
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !60
  %9 = load i32*, i32** %data, align 8, !dbg !61
  %10 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx4 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !61
  store i32 %8, i32* %arrayidx4, align 4, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %11, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !70
  %arrayidx5 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !70
  store i32 0, i32* %arrayidx5, align 4, !dbg !71
  %13 = load i32*, i32** %data, align 8, !dbg !72
  call void @printWLine(i32* %13), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_09_good() #0 !dbg !75 {
entry:
  call void @goodG2B1(), !dbg !76
  call void @goodG2B2(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* null) #4, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #4, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_09_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_09_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !99 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %0 = alloca i8, i64 400, align 16, !dbg !104
  %1 = bitcast i8* %0 to i32*, !dbg !105
  store i32* %1, i32** %dataBuffer, align 8, !dbg !103
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !106
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !107
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !108
  store i32 0, i32* %arrayidx, align 4, !dbg !109
  %4 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !110
  %tobool = icmp ne i32 %4, 0, !dbg !110
  br i1 %tobool, label %if.then, label %if.else, !dbg !112

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !113
  br label %if.end, !dbg !115

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !116
  store i32* %5, i32** %data, align 8, !dbg !118
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !119, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !122, metadata !DIExpression()), !dbg !123
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !124
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !125
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !126
  store i32 0, i32* %arrayidx2, align 4, !dbg !127
  store i64 0, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !130

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !131
  %cmp = icmp ult i64 %6, 100, !dbg !133
  br i1 %cmp, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !137
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !137
  %9 = load i32*, i32** %data, align 8, !dbg !138
  %10 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx4 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !138
  store i32 %8, i32* %arrayidx4, align 4, !dbg !140
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !142
  %inc = add i64 %11, 1, !dbg !142
  store i64 %inc, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !143, !llvm.loop !144

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !146
  %arrayidx5 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !146
  store i32 0, i32* %arrayidx5, align 4, !dbg !147
  %13 = load i32*, i32** %data, align 8, !dbg !148
  call void @printWLine(i32* %13), !dbg !149
  ret void, !dbg !150
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !151 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !152, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !154, metadata !DIExpression()), !dbg !155
  %0 = alloca i8, i64 400, align 16, !dbg !156
  %1 = bitcast i8* %0 to i32*, !dbg !157
  store i32* %1, i32** %dataBuffer, align 8, !dbg !155
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !158
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !159
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !160
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !160
  store i32 0, i32* %arrayidx, align 4, !dbg !161
  %4 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !162
  %tobool = icmp ne i32 %4, 0, !dbg !162
  br i1 %tobool, label %if.then, label %if.end, !dbg !164

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !165
  store i32* %5, i32** %data, align 8, !dbg !167
  br label %if.end, !dbg !168

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !169, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !172, metadata !DIExpression()), !dbg !173
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !174
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !175
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !176
  store i32 0, i32* %arrayidx2, align 4, !dbg !177
  store i64 0, i64* %i, align 8, !dbg !178
  br label %for.cond, !dbg !180

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !181
  %cmp = icmp ult i64 %6, 100, !dbg !183
  br i1 %cmp, label %for.body, label %for.end, !dbg !184

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !185
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !187
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !187
  %9 = load i32*, i32** %data, align 8, !dbg !188
  %10 = load i64, i64* %i, align 8, !dbg !189
  %arrayidx4 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !188
  store i32 %8, i32* %arrayidx4, align 4, !dbg !190
  br label %for.inc, !dbg !191

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !192
  %inc = add i64 %11, 1, !dbg !192
  store i64 %inc, i64* %i, align 8, !dbg !192
  br label %for.cond, !dbg !193, !llvm.loop !194

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !196
  %arrayidx5 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !196
  store i32 0, i32* %arrayidx5, align 4, !dbg !197
  %13 = load i32*, i32** %data, align 8, !dbg !198
  call void @printWLine(i32* %13), !dbg !199
  ret void, !dbg !200
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_09.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_loop_09_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_09.c", directory: "/home/joelyang/SSE-Assessment")
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
!29 = !DILocation(line: 29, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !15, file: !16, line: 29, column: 8)
!31 = !DILocation(line: 29, column: 8, scope: !15)
!32 = !DILocation(line: 32, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !16, line: 30, column: 5)
!34 = !DILocation(line: 32, column: 27, scope: !33)
!35 = !DILocation(line: 32, column: 14, scope: !33)
!36 = !DILocation(line: 33, column: 5, scope: !33)
!37 = !DILocalVariable(name: "i", scope: !38, file: !16, line: 35, type: !39)
!38 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 5)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !40)
!40 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 35, column: 16, scope: !38)
!42 = !DILocalVariable(name: "source", scope: !38, file: !16, line: 36, type: !43)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 36, column: 17, scope: !38)
!47 = !DILocation(line: 37, column: 17, scope: !38)
!48 = !DILocation(line: 37, column: 9, scope: !38)
!49 = !DILocation(line: 38, column: 9, scope: !38)
!50 = !DILocation(line: 38, column: 23, scope: !38)
!51 = !DILocation(line: 40, column: 16, scope: !52)
!52 = distinct !DILexicalBlock(scope: !38, file: !16, line: 40, column: 9)
!53 = !DILocation(line: 40, column: 14, scope: !52)
!54 = !DILocation(line: 40, column: 21, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !16, line: 40, column: 9)
!56 = !DILocation(line: 40, column: 23, scope: !55)
!57 = !DILocation(line: 40, column: 9, scope: !52)
!58 = !DILocation(line: 42, column: 30, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !16, line: 41, column: 9)
!60 = !DILocation(line: 42, column: 23, scope: !59)
!61 = !DILocation(line: 42, column: 13, scope: !59)
!62 = !DILocation(line: 42, column: 18, scope: !59)
!63 = !DILocation(line: 42, column: 21, scope: !59)
!64 = !DILocation(line: 43, column: 9, scope: !59)
!65 = !DILocation(line: 40, column: 31, scope: !55)
!66 = !DILocation(line: 40, column: 9, scope: !55)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 43, column: 9, scope: !52)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 45, column: 9, scope: !38)
!71 = !DILocation(line: 45, column: 21, scope: !38)
!72 = !DILocation(line: 46, column: 20, scope: !38)
!73 = !DILocation(line: 46, column: 9, scope: !38)
!74 = !DILocation(line: 48, column: 1, scope: !15)
!75 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_loop_09_good", scope: !16, file: !16, line: 115, type: !17, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 117, column: 5, scope: !75)
!77 = !DILocation(line: 118, column: 5, scope: !75)
!78 = !DILocation(line: 119, column: 1, scope: !75)
!79 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 131, type: !80, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!7, !7, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !16, line: 131, type: !7)
!86 = !DILocation(line: 131, column: 14, scope: !79)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !16, line: 131, type: !82)
!88 = !DILocation(line: 131, column: 27, scope: !79)
!89 = !DILocation(line: 134, column: 22, scope: !79)
!90 = !DILocation(line: 134, column: 12, scope: !79)
!91 = !DILocation(line: 134, column: 5, scope: !79)
!92 = !DILocation(line: 136, column: 5, scope: !79)
!93 = !DILocation(line: 137, column: 5, scope: !79)
!94 = !DILocation(line: 138, column: 5, scope: !79)
!95 = !DILocation(line: 141, column: 5, scope: !79)
!96 = !DILocation(line: 142, column: 5, scope: !79)
!97 = !DILocation(line: 143, column: 5, scope: !79)
!98 = !DILocation(line: 145, column: 5, scope: !79)
!99 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 55, type: !17, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !16, line: 57, type: !4)
!101 = !DILocation(line: 57, column: 15, scope: !99)
!102 = !DILocalVariable(name: "dataBuffer", scope: !99, file: !16, line: 58, type: !4)
!103 = !DILocation(line: 58, column: 15, scope: !99)
!104 = !DILocation(line: 58, column: 39, scope: !99)
!105 = !DILocation(line: 58, column: 28, scope: !99)
!106 = !DILocation(line: 59, column: 13, scope: !99)
!107 = !DILocation(line: 59, column: 5, scope: !99)
!108 = !DILocation(line: 60, column: 5, scope: !99)
!109 = !DILocation(line: 60, column: 23, scope: !99)
!110 = !DILocation(line: 61, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !99, file: !16, line: 61, column: 8)
!112 = !DILocation(line: 61, column: 8, scope: !99)
!113 = !DILocation(line: 64, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !16, line: 62, column: 5)
!115 = !DILocation(line: 65, column: 5, scope: !114)
!116 = !DILocation(line: 69, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !111, file: !16, line: 67, column: 5)
!118 = !DILocation(line: 69, column: 14, scope: !117)
!119 = !DILocalVariable(name: "i", scope: !120, file: !16, line: 72, type: !39)
!120 = distinct !DILexicalBlock(scope: !99, file: !16, line: 71, column: 5)
!121 = !DILocation(line: 72, column: 16, scope: !120)
!122 = !DILocalVariable(name: "source", scope: !120, file: !16, line: 73, type: !43)
!123 = !DILocation(line: 73, column: 17, scope: !120)
!124 = !DILocation(line: 74, column: 17, scope: !120)
!125 = !DILocation(line: 74, column: 9, scope: !120)
!126 = !DILocation(line: 75, column: 9, scope: !120)
!127 = !DILocation(line: 75, column: 23, scope: !120)
!128 = !DILocation(line: 77, column: 16, scope: !129)
!129 = distinct !DILexicalBlock(scope: !120, file: !16, line: 77, column: 9)
!130 = !DILocation(line: 77, column: 14, scope: !129)
!131 = !DILocation(line: 77, column: 21, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !16, line: 77, column: 9)
!133 = !DILocation(line: 77, column: 23, scope: !132)
!134 = !DILocation(line: 77, column: 9, scope: !129)
!135 = !DILocation(line: 79, column: 30, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !16, line: 78, column: 9)
!137 = !DILocation(line: 79, column: 23, scope: !136)
!138 = !DILocation(line: 79, column: 13, scope: !136)
!139 = !DILocation(line: 79, column: 18, scope: !136)
!140 = !DILocation(line: 79, column: 21, scope: !136)
!141 = !DILocation(line: 80, column: 9, scope: !136)
!142 = !DILocation(line: 77, column: 31, scope: !132)
!143 = !DILocation(line: 77, column: 9, scope: !132)
!144 = distinct !{!144, !134, !145, !69}
!145 = !DILocation(line: 80, column: 9, scope: !129)
!146 = !DILocation(line: 82, column: 9, scope: !120)
!147 = !DILocation(line: 82, column: 21, scope: !120)
!148 = !DILocation(line: 83, column: 20, scope: !120)
!149 = !DILocation(line: 83, column: 9, scope: !120)
!150 = !DILocation(line: 85, column: 1, scope: !99)
!151 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 88, type: !17, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!152 = !DILocalVariable(name: "data", scope: !151, file: !16, line: 90, type: !4)
!153 = !DILocation(line: 90, column: 15, scope: !151)
!154 = !DILocalVariable(name: "dataBuffer", scope: !151, file: !16, line: 91, type: !4)
!155 = !DILocation(line: 91, column: 15, scope: !151)
!156 = !DILocation(line: 91, column: 39, scope: !151)
!157 = !DILocation(line: 91, column: 28, scope: !151)
!158 = !DILocation(line: 92, column: 13, scope: !151)
!159 = !DILocation(line: 92, column: 5, scope: !151)
!160 = !DILocation(line: 93, column: 5, scope: !151)
!161 = !DILocation(line: 93, column: 23, scope: !151)
!162 = !DILocation(line: 94, column: 8, scope: !163)
!163 = distinct !DILexicalBlock(scope: !151, file: !16, line: 94, column: 8)
!164 = !DILocation(line: 94, column: 8, scope: !151)
!165 = !DILocation(line: 97, column: 16, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !16, line: 95, column: 5)
!167 = !DILocation(line: 97, column: 14, scope: !166)
!168 = !DILocation(line: 98, column: 5, scope: !166)
!169 = !DILocalVariable(name: "i", scope: !170, file: !16, line: 100, type: !39)
!170 = distinct !DILexicalBlock(scope: !151, file: !16, line: 99, column: 5)
!171 = !DILocation(line: 100, column: 16, scope: !170)
!172 = !DILocalVariable(name: "source", scope: !170, file: !16, line: 101, type: !43)
!173 = !DILocation(line: 101, column: 17, scope: !170)
!174 = !DILocation(line: 102, column: 17, scope: !170)
!175 = !DILocation(line: 102, column: 9, scope: !170)
!176 = !DILocation(line: 103, column: 9, scope: !170)
!177 = !DILocation(line: 103, column: 23, scope: !170)
!178 = !DILocation(line: 105, column: 16, scope: !179)
!179 = distinct !DILexicalBlock(scope: !170, file: !16, line: 105, column: 9)
!180 = !DILocation(line: 105, column: 14, scope: !179)
!181 = !DILocation(line: 105, column: 21, scope: !182)
!182 = distinct !DILexicalBlock(scope: !179, file: !16, line: 105, column: 9)
!183 = !DILocation(line: 105, column: 23, scope: !182)
!184 = !DILocation(line: 105, column: 9, scope: !179)
!185 = !DILocation(line: 107, column: 30, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !16, line: 106, column: 9)
!187 = !DILocation(line: 107, column: 23, scope: !186)
!188 = !DILocation(line: 107, column: 13, scope: !186)
!189 = !DILocation(line: 107, column: 18, scope: !186)
!190 = !DILocation(line: 107, column: 21, scope: !186)
!191 = !DILocation(line: 108, column: 9, scope: !186)
!192 = !DILocation(line: 105, column: 31, scope: !182)
!193 = !DILocation(line: 105, column: 9, scope: !182)
!194 = distinct !{!194, !184, !195, !69}
!195 = !DILocation(line: 108, column: 9, scope: !179)
!196 = !DILocation(line: 110, column: 9, scope: !170)
!197 = !DILocation(line: 110, column: 21, scope: !170)
!198 = !DILocation(line: 111, column: 20, scope: !170)
!199 = !DILocation(line: 111, column: 9, scope: !170)
!200 = !DILocation(line: 113, column: 1, scope: !151)
