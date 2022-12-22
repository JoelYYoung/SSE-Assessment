; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_15.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_15_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
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
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !30
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !33
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !34
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !35
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !35
  store i32 0, i32* %arrayidx2, align 4, !dbg !36
  %8 = load i32*, i32** %dataBadBuffer, align 8, !dbg !37
  store i32* %8, i32** %data, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !46, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !51
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !52
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !53
  store i32 0, i32* %arrayidx4, align 4, !dbg !54
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !55
  %call6 = call i64 @wcslen(i32* %arraydecay5) #6, !dbg !56
  store i64 %call6, i64* %destLen, align 8, !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i64, i64* %i, align 8, !dbg !61
  %10 = load i64, i64* %destLen, align 8, !dbg !63
  %cmp = icmp ult i64 %9, %10, !dbg !64
  br i1 %cmp, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !66
  %12 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !66
  %13 = load i32, i32* %arrayidx7, align 4, !dbg !66
  %14 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %14, !dbg !70
  store i32 %13, i32* %arrayidx8, align 4, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %15, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !78
  store i32 0, i32* %arrayidx9, align 4, !dbg !79
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !80
  call void @printWLine(i32* %arraydecay10), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_15_good() #0 !dbg !83 {
entry:
  call void @goodG2B1(), !dbg !84
  call void @goodG2B2(), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !87 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !93, metadata !DIExpression()), !dbg !94
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call i64 @time(i64* null) #5, !dbg !97
  %conv = trunc i64 %call to i32, !dbg !98
  call void @srand(i32 %conv) #5, !dbg !99
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !100
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_15_good(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_15_bad(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !107 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %0 = alloca i8, i64 200, align 16, !dbg !112
  %1 = bitcast i8* %0 to i32*, !dbg !113
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %2 = alloca i8, i64 400, align 16, !dbg !116
  %3 = bitcast i8* %2 to i32*, !dbg !117
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !115
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !118
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !119
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !120
  store i32 0, i32* %arrayidx, align 4, !dbg !121
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !122
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !123
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !124
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !124
  store i32 0, i32* %arrayidx2, align 4, !dbg !125
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !126
  store i32* %8, i32** %data, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata i64* %i, metadata !128, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !133, metadata !DIExpression()), !dbg !134
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !135
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !136
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !137
  store i32 0, i32* %arrayidx4, align 4, !dbg !138
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !139
  %call6 = call i64 @wcslen(i32* %arraydecay5) #6, !dbg !140
  store i64 %call6, i64* %destLen, align 8, !dbg !141
  store i64 0, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !144

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i64, i64* %i, align 8, !dbg !145
  %10 = load i64, i64* %destLen, align 8, !dbg !147
  %cmp = icmp ult i64 %9, %10, !dbg !148
  br i1 %cmp, label %for.body, label %for.end, !dbg !149

for.body:                                         ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !150
  %12 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !150
  %13 = load i32, i32* %arrayidx7, align 4, !dbg !150
  %14 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %14, !dbg !154
  store i32 %13, i32* %arrayidx8, align 4, !dbg !155
  br label %for.inc, !dbg !156

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !157
  %inc = add i64 %15, 1, !dbg !157
  store i64 %inc, i64* %i, align 8, !dbg !157
  br label %for.cond, !dbg !158, !llvm.loop !159

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !161
  store i32 0, i32* %arrayidx9, align 4, !dbg !162
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !163
  call void @printWLine(i32* %arraydecay10), !dbg !164
  ret void, !dbg !165
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !166 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !167, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !169, metadata !DIExpression()), !dbg !170
  %0 = alloca i8, i64 200, align 16, !dbg !171
  %1 = bitcast i8* %0 to i32*, !dbg !172
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !170
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !173, metadata !DIExpression()), !dbg !174
  %2 = alloca i8, i64 400, align 16, !dbg !175
  %3 = bitcast i8* %2 to i32*, !dbg !176
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !174
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !177
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !178
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !179
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !179
  store i32 0, i32* %arrayidx, align 4, !dbg !180
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !181
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !182
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !183
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !183
  store i32 0, i32* %arrayidx2, align 4, !dbg !184
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !185
  store i32* %8, i32** %data, align 8, !dbg !186
  call void @llvm.dbg.declare(metadata i64* %i, metadata !187, metadata !DIExpression()), !dbg !189
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !190, metadata !DIExpression()), !dbg !191
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !192, metadata !DIExpression()), !dbg !193
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !194
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !195
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !196
  store i32 0, i32* %arrayidx4, align 4, !dbg !197
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !198
  %call6 = call i64 @wcslen(i32* %arraydecay5) #6, !dbg !199
  store i64 %call6, i64* %destLen, align 8, !dbg !200
  store i64 0, i64* %i, align 8, !dbg !201
  br label %for.cond, !dbg !203

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i64, i64* %i, align 8, !dbg !204
  %10 = load i64, i64* %destLen, align 8, !dbg !206
  %cmp = icmp ult i64 %9, %10, !dbg !207
  br i1 %cmp, label %for.body, label %for.end, !dbg !208

for.body:                                         ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !209
  %12 = load i64, i64* %i, align 8, !dbg !211
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !209
  %13 = load i32, i32* %arrayidx7, align 4, !dbg !209
  %14 = load i64, i64* %i, align 8, !dbg !212
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %14, !dbg !213
  store i32 %13, i32* %arrayidx8, align 4, !dbg !214
  br label %for.inc, !dbg !215

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !216
  %inc = add i64 %15, 1, !dbg !216
  store i64 %inc, i64* %i, align 8, !dbg !216
  br label %for.cond, !dbg !217, !llvm.loop !218

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !220
  store i32 0, i32* %arrayidx9, align 4, !dbg !221
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !222
  call void @printWLine(i32* %arraydecay10), !dbg !223
  ret void, !dbg !224
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_15.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_15_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_15.c", directory: "/root/SSE-Assessment")
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
!29 = !DILocation(line: 28, column: 13, scope: !15)
!30 = !DILocation(line: 28, column: 5, scope: !15)
!31 = !DILocation(line: 29, column: 5, scope: !15)
!32 = !DILocation(line: 29, column: 25, scope: !15)
!33 = !DILocation(line: 30, column: 13, scope: !15)
!34 = !DILocation(line: 30, column: 5, scope: !15)
!35 = !DILocation(line: 31, column: 5, scope: !15)
!36 = !DILocation(line: 31, column: 27, scope: !15)
!37 = !DILocation(line: 36, column: 16, scope: !15)
!38 = !DILocation(line: 36, column: 14, scope: !15)
!39 = !DILocalVariable(name: "i", scope: !40, file: !16, line: 44, type: !41)
!40 = distinct !DILexicalBlock(scope: !15, file: !16, line: 43, column: 5)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !42)
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 44, column: 16, scope: !40)
!44 = !DILocalVariable(name: "destLen", scope: !40, file: !16, line: 44, type: !41)
!45 = !DILocation(line: 44, column: 19, scope: !40)
!46 = !DILocalVariable(name: "dest", scope: !40, file: !16, line: 45, type: !47)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 45, column: 17, scope: !40)
!51 = !DILocation(line: 46, column: 17, scope: !40)
!52 = !DILocation(line: 46, column: 9, scope: !40)
!53 = !DILocation(line: 47, column: 9, scope: !40)
!54 = !DILocation(line: 47, column: 21, scope: !40)
!55 = !DILocation(line: 48, column: 26, scope: !40)
!56 = !DILocation(line: 48, column: 19, scope: !40)
!57 = !DILocation(line: 48, column: 17, scope: !40)
!58 = !DILocation(line: 51, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !40, file: !16, line: 51, column: 9)
!60 = !DILocation(line: 51, column: 14, scope: !59)
!61 = !DILocation(line: 51, column: 21, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !16, line: 51, column: 9)
!63 = !DILocation(line: 51, column: 25, scope: !62)
!64 = !DILocation(line: 51, column: 23, scope: !62)
!65 = !DILocation(line: 51, column: 9, scope: !59)
!66 = !DILocation(line: 53, column: 23, scope: !67)
!67 = distinct !DILexicalBlock(scope: !62, file: !16, line: 52, column: 9)
!68 = !DILocation(line: 53, column: 28, scope: !67)
!69 = !DILocation(line: 53, column: 18, scope: !67)
!70 = !DILocation(line: 53, column: 13, scope: !67)
!71 = !DILocation(line: 53, column: 21, scope: !67)
!72 = !DILocation(line: 54, column: 9, scope: !67)
!73 = !DILocation(line: 51, column: 35, scope: !62)
!74 = !DILocation(line: 51, column: 9, scope: !62)
!75 = distinct !{!75, !65, !76, !77}
!76 = !DILocation(line: 54, column: 9, scope: !59)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 55, column: 9, scope: !40)
!79 = !DILocation(line: 55, column: 21, scope: !40)
!80 = !DILocation(line: 56, column: 20, scope: !40)
!81 = !DILocation(line: 56, column: 9, scope: !40)
!82 = !DILocation(line: 58, column: 1, scope: !15)
!83 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_15_good", scope: !16, file: !16, line: 140, type: !17, scopeLine: 141, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocation(line: 142, column: 5, scope: !83)
!85 = !DILocation(line: 143, column: 5, scope: !83)
!86 = !DILocation(line: 144, column: 1, scope: !83)
!87 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 156, type: !88, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DISubroutineType(types: !89)
!89 = !{!7, !7, !90}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !16, line: 156, type: !7)
!94 = !DILocation(line: 156, column: 14, scope: !87)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !16, line: 156, type: !90)
!96 = !DILocation(line: 156, column: 27, scope: !87)
!97 = !DILocation(line: 159, column: 22, scope: !87)
!98 = !DILocation(line: 159, column: 12, scope: !87)
!99 = !DILocation(line: 159, column: 5, scope: !87)
!100 = !DILocation(line: 161, column: 5, scope: !87)
!101 = !DILocation(line: 162, column: 5, scope: !87)
!102 = !DILocation(line: 163, column: 5, scope: !87)
!103 = !DILocation(line: 166, column: 5, scope: !87)
!104 = !DILocation(line: 167, column: 5, scope: !87)
!105 = !DILocation(line: 168, column: 5, scope: !87)
!106 = !DILocation(line: 170, column: 5, scope: !87)
!107 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 65, type: !17, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !16, line: 67, type: !4)
!109 = !DILocation(line: 67, column: 15, scope: !107)
!110 = !DILocalVariable(name: "dataBadBuffer", scope: !107, file: !16, line: 68, type: !4)
!111 = !DILocation(line: 68, column: 15, scope: !107)
!112 = !DILocation(line: 68, column: 42, scope: !107)
!113 = !DILocation(line: 68, column: 31, scope: !107)
!114 = !DILocalVariable(name: "dataGoodBuffer", scope: !107, file: !16, line: 69, type: !4)
!115 = !DILocation(line: 69, column: 15, scope: !107)
!116 = !DILocation(line: 69, column: 43, scope: !107)
!117 = !DILocation(line: 69, column: 32, scope: !107)
!118 = !DILocation(line: 70, column: 13, scope: !107)
!119 = !DILocation(line: 70, column: 5, scope: !107)
!120 = !DILocation(line: 71, column: 5, scope: !107)
!121 = !DILocation(line: 71, column: 25, scope: !107)
!122 = !DILocation(line: 72, column: 13, scope: !107)
!123 = !DILocation(line: 72, column: 5, scope: !107)
!124 = !DILocation(line: 73, column: 5, scope: !107)
!125 = !DILocation(line: 73, column: 27, scope: !107)
!126 = !DILocation(line: 82, column: 16, scope: !107)
!127 = !DILocation(line: 82, column: 14, scope: !107)
!128 = !DILocalVariable(name: "i", scope: !129, file: !16, line: 86, type: !41)
!129 = distinct !DILexicalBlock(scope: !107, file: !16, line: 85, column: 5)
!130 = !DILocation(line: 86, column: 16, scope: !129)
!131 = !DILocalVariable(name: "destLen", scope: !129, file: !16, line: 86, type: !41)
!132 = !DILocation(line: 86, column: 19, scope: !129)
!133 = !DILocalVariable(name: "dest", scope: !129, file: !16, line: 87, type: !47)
!134 = !DILocation(line: 87, column: 17, scope: !129)
!135 = !DILocation(line: 88, column: 17, scope: !129)
!136 = !DILocation(line: 88, column: 9, scope: !129)
!137 = !DILocation(line: 89, column: 9, scope: !129)
!138 = !DILocation(line: 89, column: 21, scope: !129)
!139 = !DILocation(line: 90, column: 26, scope: !129)
!140 = !DILocation(line: 90, column: 19, scope: !129)
!141 = !DILocation(line: 90, column: 17, scope: !129)
!142 = !DILocation(line: 93, column: 16, scope: !143)
!143 = distinct !DILexicalBlock(scope: !129, file: !16, line: 93, column: 9)
!144 = !DILocation(line: 93, column: 14, scope: !143)
!145 = !DILocation(line: 93, column: 21, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !16, line: 93, column: 9)
!147 = !DILocation(line: 93, column: 25, scope: !146)
!148 = !DILocation(line: 93, column: 23, scope: !146)
!149 = !DILocation(line: 93, column: 9, scope: !143)
!150 = !DILocation(line: 95, column: 23, scope: !151)
!151 = distinct !DILexicalBlock(scope: !146, file: !16, line: 94, column: 9)
!152 = !DILocation(line: 95, column: 28, scope: !151)
!153 = !DILocation(line: 95, column: 18, scope: !151)
!154 = !DILocation(line: 95, column: 13, scope: !151)
!155 = !DILocation(line: 95, column: 21, scope: !151)
!156 = !DILocation(line: 96, column: 9, scope: !151)
!157 = !DILocation(line: 93, column: 35, scope: !146)
!158 = !DILocation(line: 93, column: 9, scope: !146)
!159 = distinct !{!159, !149, !160, !77}
!160 = !DILocation(line: 96, column: 9, scope: !143)
!161 = !DILocation(line: 97, column: 9, scope: !129)
!162 = !DILocation(line: 97, column: 21, scope: !129)
!163 = !DILocation(line: 98, column: 20, scope: !129)
!164 = !DILocation(line: 98, column: 9, scope: !129)
!165 = !DILocation(line: 100, column: 1, scope: !107)
!166 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 103, type: !17, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!167 = !DILocalVariable(name: "data", scope: !166, file: !16, line: 105, type: !4)
!168 = !DILocation(line: 105, column: 15, scope: !166)
!169 = !DILocalVariable(name: "dataBadBuffer", scope: !166, file: !16, line: 106, type: !4)
!170 = !DILocation(line: 106, column: 15, scope: !166)
!171 = !DILocation(line: 106, column: 42, scope: !166)
!172 = !DILocation(line: 106, column: 31, scope: !166)
!173 = !DILocalVariable(name: "dataGoodBuffer", scope: !166, file: !16, line: 107, type: !4)
!174 = !DILocation(line: 107, column: 15, scope: !166)
!175 = !DILocation(line: 107, column: 43, scope: !166)
!176 = !DILocation(line: 107, column: 32, scope: !166)
!177 = !DILocation(line: 108, column: 13, scope: !166)
!178 = !DILocation(line: 108, column: 5, scope: !166)
!179 = !DILocation(line: 109, column: 5, scope: !166)
!180 = !DILocation(line: 109, column: 25, scope: !166)
!181 = !DILocation(line: 110, column: 13, scope: !166)
!182 = !DILocation(line: 110, column: 5, scope: !166)
!183 = !DILocation(line: 111, column: 5, scope: !166)
!184 = !DILocation(line: 111, column: 27, scope: !166)
!185 = !DILocation(line: 116, column: 16, scope: !166)
!186 = !DILocation(line: 116, column: 14, scope: !166)
!187 = !DILocalVariable(name: "i", scope: !188, file: !16, line: 124, type: !41)
!188 = distinct !DILexicalBlock(scope: !166, file: !16, line: 123, column: 5)
!189 = !DILocation(line: 124, column: 16, scope: !188)
!190 = !DILocalVariable(name: "destLen", scope: !188, file: !16, line: 124, type: !41)
!191 = !DILocation(line: 124, column: 19, scope: !188)
!192 = !DILocalVariable(name: "dest", scope: !188, file: !16, line: 125, type: !47)
!193 = !DILocation(line: 125, column: 17, scope: !188)
!194 = !DILocation(line: 126, column: 17, scope: !188)
!195 = !DILocation(line: 126, column: 9, scope: !188)
!196 = !DILocation(line: 127, column: 9, scope: !188)
!197 = !DILocation(line: 127, column: 21, scope: !188)
!198 = !DILocation(line: 128, column: 26, scope: !188)
!199 = !DILocation(line: 128, column: 19, scope: !188)
!200 = !DILocation(line: 128, column: 17, scope: !188)
!201 = !DILocation(line: 131, column: 16, scope: !202)
!202 = distinct !DILexicalBlock(scope: !188, file: !16, line: 131, column: 9)
!203 = !DILocation(line: 131, column: 14, scope: !202)
!204 = !DILocation(line: 131, column: 21, scope: !205)
!205 = distinct !DILexicalBlock(scope: !202, file: !16, line: 131, column: 9)
!206 = !DILocation(line: 131, column: 25, scope: !205)
!207 = !DILocation(line: 131, column: 23, scope: !205)
!208 = !DILocation(line: 131, column: 9, scope: !202)
!209 = !DILocation(line: 133, column: 23, scope: !210)
!210 = distinct !DILexicalBlock(scope: !205, file: !16, line: 132, column: 9)
!211 = !DILocation(line: 133, column: 28, scope: !210)
!212 = !DILocation(line: 133, column: 18, scope: !210)
!213 = !DILocation(line: 133, column: 13, scope: !210)
!214 = !DILocation(line: 133, column: 21, scope: !210)
!215 = !DILocation(line: 134, column: 9, scope: !210)
!216 = !DILocation(line: 131, column: 35, scope: !205)
!217 = !DILocation(line: 131, column: 9, scope: !205)
!218 = distinct !{!218, !208, !219, !77}
!219 = !DILocation(line: 134, column: 9, scope: !202)
!220 = !DILocation(line: 135, column: 9, scope: !188)
!221 = !DILocation(line: 135, column: 21, scope: !188)
!222 = !DILocation(line: 136, column: 20, scope: !188)
!223 = !DILocation(line: 136, column: 9, scope: !188)
!224 = !DILocation(line: 138, column: 1, scope: !166)
