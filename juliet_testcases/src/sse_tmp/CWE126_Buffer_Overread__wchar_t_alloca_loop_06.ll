; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_06.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_06_bad() #0 !dbg !15 {
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
  store i32* %8, i32** %data, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !48, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !53
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !54
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !55
  store i32 0, i32* %arrayidx4, align 4, !dbg !56
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !57
  %call6 = call i64 @wcslen(i32* %arraydecay5) #6, !dbg !58
  store i64 %call6, i64* %destLen, align 8, !dbg !59
  store i64 0, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i64, i64* %i, align 8, !dbg !63
  %10 = load i64, i64* %destLen, align 8, !dbg !65
  %cmp = icmp ult i64 %9, %10, !dbg !66
  br i1 %cmp, label %for.body, label %for.end, !dbg !67

for.body:                                         ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !68
  %12 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !68
  %13 = load i32, i32* %arrayidx7, align 4, !dbg !68
  %14 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %14, !dbg !72
  store i32 %13, i32* %arrayidx8, align 4, !dbg !73
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !75
  %inc = add i64 %15, 1, !dbg !75
  store i64 %inc, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !80
  store i32 0, i32* %arrayidx9, align 4, !dbg !81
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !82
  call void @printWLine(i32* %arraydecay10), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_06_good() #0 !dbg !85 {
entry:
  call void @goodG2B1(), !dbg !86
  call void @goodG2B2(), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !89 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !95, metadata !DIExpression()), !dbg !96
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !97, metadata !DIExpression()), !dbg !98
  %call = call i64 @time(i64* null) #5, !dbg !99
  %conv = trunc i64 %call to i32, !dbg !100
  call void @srand(i32 %conv) #5, !dbg !101
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !102
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_06_good(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !105
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_06_bad(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !107
  ret i32 0, !dbg !108
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !109 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %0 = alloca i8, i64 200, align 16, !dbg !114
  %1 = bitcast i8* %0 to i32*, !dbg !115
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %2 = alloca i8, i64 400, align 16, !dbg !118
  %3 = bitcast i8* %2 to i32*, !dbg !119
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !117
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !120
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !121
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !122
  store i32 0, i32* %arrayidx, align 4, !dbg !123
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !124
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !125
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !126
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !126
  store i32 0, i32* %arrayidx2, align 4, !dbg !127
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !128
  store i32* %8, i32** %data, align 8, !dbg !131
  call void @llvm.dbg.declare(metadata i64* %i, metadata !132, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !135, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !137, metadata !DIExpression()), !dbg !138
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !139
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !140
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !141
  store i32 0, i32* %arrayidx4, align 4, !dbg !142
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !143
  %call6 = call i64 @wcslen(i32* %arraydecay5) #6, !dbg !144
  store i64 %call6, i64* %destLen, align 8, !dbg !145
  store i64 0, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !148

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i64, i64* %i, align 8, !dbg !149
  %10 = load i64, i64* %destLen, align 8, !dbg !151
  %cmp = icmp ult i64 %9, %10, !dbg !152
  br i1 %cmp, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !154
  %12 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !154
  %13 = load i32, i32* %arrayidx7, align 4, !dbg !154
  %14 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %14, !dbg !158
  store i32 %13, i32* %arrayidx8, align 4, !dbg !159
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !161
  %inc = add i64 %15, 1, !dbg !161
  store i64 %inc, i64* %i, align 8, !dbg !161
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !165
  store i32 0, i32* %arrayidx9, align 4, !dbg !166
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !167
  call void @printWLine(i32* %arraydecay10), !dbg !168
  ret void, !dbg !169
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !170 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !171, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !173, metadata !DIExpression()), !dbg !174
  %0 = alloca i8, i64 200, align 16, !dbg !175
  %1 = bitcast i8* %0 to i32*, !dbg !176
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !174
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !177, metadata !DIExpression()), !dbg !178
  %2 = alloca i8, i64 400, align 16, !dbg !179
  %3 = bitcast i8* %2 to i32*, !dbg !180
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !178
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !181
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !182
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !183
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !183
  store i32 0, i32* %arrayidx, align 4, !dbg !184
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !185
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !186
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !187
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !187
  store i32 0, i32* %arrayidx2, align 4, !dbg !188
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !189
  store i32* %8, i32** %data, align 8, !dbg !192
  call void @llvm.dbg.declare(metadata i64* %i, metadata !193, metadata !DIExpression()), !dbg !195
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !196, metadata !DIExpression()), !dbg !197
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !198, metadata !DIExpression()), !dbg !199
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !200
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !201
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !202
  store i32 0, i32* %arrayidx4, align 4, !dbg !203
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !204
  %call6 = call i64 @wcslen(i32* %arraydecay5) #6, !dbg !205
  store i64 %call6, i64* %destLen, align 8, !dbg !206
  store i64 0, i64* %i, align 8, !dbg !207
  br label %for.cond, !dbg !209

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i64, i64* %i, align 8, !dbg !210
  %10 = load i64, i64* %destLen, align 8, !dbg !212
  %cmp = icmp ult i64 %9, %10, !dbg !213
  br i1 %cmp, label %for.body, label %for.end, !dbg !214

for.body:                                         ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !215
  %12 = load i64, i64* %i, align 8, !dbg !217
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !215
  %13 = load i32, i32* %arrayidx7, align 4, !dbg !215
  %14 = load i64, i64* %i, align 8, !dbg !218
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %14, !dbg !219
  store i32 %13, i32* %arrayidx8, align 4, !dbg !220
  br label %for.inc, !dbg !221

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !222
  %inc = add i64 %15, 1, !dbg !222
  store i64 %inc, i64* %i, align 8, !dbg !222
  br label %for.cond, !dbg !223, !llvm.loop !224

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !226
  store i32 0, i32* %arrayidx9, align 4, !dbg !227
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !228
  call void @printWLine(i32* %arraydecay10), !dbg !229
  ret void, !dbg !230
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_06.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_06_bad", scope: !16, file: !16, line: 27, type: !17, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_06.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 29, type: !4)
!20 = !DILocation(line: 29, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 30, type: !4)
!22 = !DILocation(line: 30, column: 15, scope: !15)
!23 = !DILocation(line: 30, column: 42, scope: !15)
!24 = !DILocation(line: 30, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 31, type: !4)
!26 = !DILocation(line: 31, column: 15, scope: !15)
!27 = !DILocation(line: 31, column: 43, scope: !15)
!28 = !DILocation(line: 31, column: 32, scope: !15)
!29 = !DILocation(line: 32, column: 13, scope: !15)
!30 = !DILocation(line: 32, column: 5, scope: !15)
!31 = !DILocation(line: 33, column: 5, scope: !15)
!32 = !DILocation(line: 33, column: 25, scope: !15)
!33 = !DILocation(line: 34, column: 13, scope: !15)
!34 = !DILocation(line: 34, column: 5, scope: !15)
!35 = !DILocation(line: 35, column: 5, scope: !15)
!36 = !DILocation(line: 35, column: 27, scope: !15)
!37 = !DILocation(line: 39, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !39, file: !16, line: 37, column: 5)
!39 = distinct !DILexicalBlock(scope: !15, file: !16, line: 36, column: 8)
!40 = !DILocation(line: 39, column: 14, scope: !38)
!41 = !DILocalVariable(name: "i", scope: !42, file: !16, line: 42, type: !43)
!42 = distinct !DILexicalBlock(scope: !15, file: !16, line: 41, column: 5)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !44)
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 42, column: 16, scope: !42)
!46 = !DILocalVariable(name: "destLen", scope: !42, file: !16, line: 42, type: !43)
!47 = !DILocation(line: 42, column: 19, scope: !42)
!48 = !DILocalVariable(name: "dest", scope: !42, file: !16, line: 43, type: !49)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 100)
!52 = !DILocation(line: 43, column: 17, scope: !42)
!53 = !DILocation(line: 44, column: 17, scope: !42)
!54 = !DILocation(line: 44, column: 9, scope: !42)
!55 = !DILocation(line: 45, column: 9, scope: !42)
!56 = !DILocation(line: 45, column: 21, scope: !42)
!57 = !DILocation(line: 46, column: 26, scope: !42)
!58 = !DILocation(line: 46, column: 19, scope: !42)
!59 = !DILocation(line: 46, column: 17, scope: !42)
!60 = !DILocation(line: 49, column: 16, scope: !61)
!61 = distinct !DILexicalBlock(scope: !42, file: !16, line: 49, column: 9)
!62 = !DILocation(line: 49, column: 14, scope: !61)
!63 = !DILocation(line: 49, column: 21, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !16, line: 49, column: 9)
!65 = !DILocation(line: 49, column: 25, scope: !64)
!66 = !DILocation(line: 49, column: 23, scope: !64)
!67 = !DILocation(line: 49, column: 9, scope: !61)
!68 = !DILocation(line: 51, column: 23, scope: !69)
!69 = distinct !DILexicalBlock(scope: !64, file: !16, line: 50, column: 9)
!70 = !DILocation(line: 51, column: 28, scope: !69)
!71 = !DILocation(line: 51, column: 18, scope: !69)
!72 = !DILocation(line: 51, column: 13, scope: !69)
!73 = !DILocation(line: 51, column: 21, scope: !69)
!74 = !DILocation(line: 52, column: 9, scope: !69)
!75 = !DILocation(line: 49, column: 35, scope: !64)
!76 = !DILocation(line: 49, column: 9, scope: !64)
!77 = distinct !{!77, !67, !78, !79}
!78 = !DILocation(line: 52, column: 9, scope: !61)
!79 = !{!"llvm.loop.mustprogress"}
!80 = !DILocation(line: 53, column: 9, scope: !42)
!81 = !DILocation(line: 53, column: 21, scope: !42)
!82 = !DILocation(line: 54, column: 20, scope: !42)
!83 = !DILocation(line: 54, column: 9, scope: !42)
!84 = !DILocation(line: 56, column: 1, scope: !15)
!85 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_06_good", scope: !16, file: !16, line: 131, type: !17, scopeLine: 132, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocation(line: 133, column: 5, scope: !85)
!87 = !DILocation(line: 134, column: 5, scope: !85)
!88 = !DILocation(line: 135, column: 1, scope: !85)
!89 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 147, type: !90, scopeLine: 148, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DISubroutineType(types: !91)
!91 = !{!7, !7, !92}
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!95 = !DILocalVariable(name: "argc", arg: 1, scope: !89, file: !16, line: 147, type: !7)
!96 = !DILocation(line: 147, column: 14, scope: !89)
!97 = !DILocalVariable(name: "argv", arg: 2, scope: !89, file: !16, line: 147, type: !92)
!98 = !DILocation(line: 147, column: 27, scope: !89)
!99 = !DILocation(line: 150, column: 22, scope: !89)
!100 = !DILocation(line: 150, column: 12, scope: !89)
!101 = !DILocation(line: 150, column: 5, scope: !89)
!102 = !DILocation(line: 152, column: 5, scope: !89)
!103 = !DILocation(line: 153, column: 5, scope: !89)
!104 = !DILocation(line: 154, column: 5, scope: !89)
!105 = !DILocation(line: 157, column: 5, scope: !89)
!106 = !DILocation(line: 158, column: 5, scope: !89)
!107 = !DILocation(line: 159, column: 5, scope: !89)
!108 = !DILocation(line: 161, column: 5, scope: !89)
!109 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 63, type: !17, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "data", scope: !109, file: !16, line: 65, type: !4)
!111 = !DILocation(line: 65, column: 15, scope: !109)
!112 = !DILocalVariable(name: "dataBadBuffer", scope: !109, file: !16, line: 66, type: !4)
!113 = !DILocation(line: 66, column: 15, scope: !109)
!114 = !DILocation(line: 66, column: 42, scope: !109)
!115 = !DILocation(line: 66, column: 31, scope: !109)
!116 = !DILocalVariable(name: "dataGoodBuffer", scope: !109, file: !16, line: 67, type: !4)
!117 = !DILocation(line: 67, column: 15, scope: !109)
!118 = !DILocation(line: 67, column: 43, scope: !109)
!119 = !DILocation(line: 67, column: 32, scope: !109)
!120 = !DILocation(line: 68, column: 13, scope: !109)
!121 = !DILocation(line: 68, column: 5, scope: !109)
!122 = !DILocation(line: 69, column: 5, scope: !109)
!123 = !DILocation(line: 69, column: 25, scope: !109)
!124 = !DILocation(line: 70, column: 13, scope: !109)
!125 = !DILocation(line: 70, column: 5, scope: !109)
!126 = !DILocation(line: 71, column: 5, scope: !109)
!127 = !DILocation(line: 71, column: 27, scope: !109)
!128 = !DILocation(line: 80, column: 16, scope: !129)
!129 = distinct !DILexicalBlock(scope: !130, file: !16, line: 78, column: 5)
!130 = distinct !DILexicalBlock(scope: !109, file: !16, line: 72, column: 8)
!131 = !DILocation(line: 80, column: 14, scope: !129)
!132 = !DILocalVariable(name: "i", scope: !133, file: !16, line: 83, type: !43)
!133 = distinct !DILexicalBlock(scope: !109, file: !16, line: 82, column: 5)
!134 = !DILocation(line: 83, column: 16, scope: !133)
!135 = !DILocalVariable(name: "destLen", scope: !133, file: !16, line: 83, type: !43)
!136 = !DILocation(line: 83, column: 19, scope: !133)
!137 = !DILocalVariable(name: "dest", scope: !133, file: !16, line: 84, type: !49)
!138 = !DILocation(line: 84, column: 17, scope: !133)
!139 = !DILocation(line: 85, column: 17, scope: !133)
!140 = !DILocation(line: 85, column: 9, scope: !133)
!141 = !DILocation(line: 86, column: 9, scope: !133)
!142 = !DILocation(line: 86, column: 21, scope: !133)
!143 = !DILocation(line: 87, column: 26, scope: !133)
!144 = !DILocation(line: 87, column: 19, scope: !133)
!145 = !DILocation(line: 87, column: 17, scope: !133)
!146 = !DILocation(line: 90, column: 16, scope: !147)
!147 = distinct !DILexicalBlock(scope: !133, file: !16, line: 90, column: 9)
!148 = !DILocation(line: 90, column: 14, scope: !147)
!149 = !DILocation(line: 90, column: 21, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !16, line: 90, column: 9)
!151 = !DILocation(line: 90, column: 25, scope: !150)
!152 = !DILocation(line: 90, column: 23, scope: !150)
!153 = !DILocation(line: 90, column: 9, scope: !147)
!154 = !DILocation(line: 92, column: 23, scope: !155)
!155 = distinct !DILexicalBlock(scope: !150, file: !16, line: 91, column: 9)
!156 = !DILocation(line: 92, column: 28, scope: !155)
!157 = !DILocation(line: 92, column: 18, scope: !155)
!158 = !DILocation(line: 92, column: 13, scope: !155)
!159 = !DILocation(line: 92, column: 21, scope: !155)
!160 = !DILocation(line: 93, column: 9, scope: !155)
!161 = !DILocation(line: 90, column: 35, scope: !150)
!162 = !DILocation(line: 90, column: 9, scope: !150)
!163 = distinct !{!163, !153, !164, !79}
!164 = !DILocation(line: 93, column: 9, scope: !147)
!165 = !DILocation(line: 94, column: 9, scope: !133)
!166 = !DILocation(line: 94, column: 21, scope: !133)
!167 = !DILocation(line: 95, column: 20, scope: !133)
!168 = !DILocation(line: 95, column: 9, scope: !133)
!169 = !DILocation(line: 97, column: 1, scope: !109)
!170 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 100, type: !17, scopeLine: 101, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!171 = !DILocalVariable(name: "data", scope: !170, file: !16, line: 102, type: !4)
!172 = !DILocation(line: 102, column: 15, scope: !170)
!173 = !DILocalVariable(name: "dataBadBuffer", scope: !170, file: !16, line: 103, type: !4)
!174 = !DILocation(line: 103, column: 15, scope: !170)
!175 = !DILocation(line: 103, column: 42, scope: !170)
!176 = !DILocation(line: 103, column: 31, scope: !170)
!177 = !DILocalVariable(name: "dataGoodBuffer", scope: !170, file: !16, line: 104, type: !4)
!178 = !DILocation(line: 104, column: 15, scope: !170)
!179 = !DILocation(line: 104, column: 43, scope: !170)
!180 = !DILocation(line: 104, column: 32, scope: !170)
!181 = !DILocation(line: 105, column: 13, scope: !170)
!182 = !DILocation(line: 105, column: 5, scope: !170)
!183 = !DILocation(line: 106, column: 5, scope: !170)
!184 = !DILocation(line: 106, column: 25, scope: !170)
!185 = !DILocation(line: 107, column: 13, scope: !170)
!186 = !DILocation(line: 107, column: 5, scope: !170)
!187 = !DILocation(line: 108, column: 5, scope: !170)
!188 = !DILocation(line: 108, column: 27, scope: !170)
!189 = !DILocation(line: 112, column: 16, scope: !190)
!190 = distinct !DILexicalBlock(scope: !191, file: !16, line: 110, column: 5)
!191 = distinct !DILexicalBlock(scope: !170, file: !16, line: 109, column: 8)
!192 = !DILocation(line: 112, column: 14, scope: !190)
!193 = !DILocalVariable(name: "i", scope: !194, file: !16, line: 115, type: !43)
!194 = distinct !DILexicalBlock(scope: !170, file: !16, line: 114, column: 5)
!195 = !DILocation(line: 115, column: 16, scope: !194)
!196 = !DILocalVariable(name: "destLen", scope: !194, file: !16, line: 115, type: !43)
!197 = !DILocation(line: 115, column: 19, scope: !194)
!198 = !DILocalVariable(name: "dest", scope: !194, file: !16, line: 116, type: !49)
!199 = !DILocation(line: 116, column: 17, scope: !194)
!200 = !DILocation(line: 117, column: 17, scope: !194)
!201 = !DILocation(line: 117, column: 9, scope: !194)
!202 = !DILocation(line: 118, column: 9, scope: !194)
!203 = !DILocation(line: 118, column: 21, scope: !194)
!204 = !DILocation(line: 119, column: 26, scope: !194)
!205 = !DILocation(line: 119, column: 19, scope: !194)
!206 = !DILocation(line: 119, column: 17, scope: !194)
!207 = !DILocation(line: 122, column: 16, scope: !208)
!208 = distinct !DILexicalBlock(scope: !194, file: !16, line: 122, column: 9)
!209 = !DILocation(line: 122, column: 14, scope: !208)
!210 = !DILocation(line: 122, column: 21, scope: !211)
!211 = distinct !DILexicalBlock(scope: !208, file: !16, line: 122, column: 9)
!212 = !DILocation(line: 122, column: 25, scope: !211)
!213 = !DILocation(line: 122, column: 23, scope: !211)
!214 = !DILocation(line: 122, column: 9, scope: !208)
!215 = !DILocation(line: 124, column: 23, scope: !216)
!216 = distinct !DILexicalBlock(scope: !211, file: !16, line: 123, column: 9)
!217 = !DILocation(line: 124, column: 28, scope: !216)
!218 = !DILocation(line: 124, column: 18, scope: !216)
!219 = !DILocation(line: 124, column: 13, scope: !216)
!220 = !DILocation(line: 124, column: 21, scope: !216)
!221 = !DILocation(line: 125, column: 9, scope: !216)
!222 = !DILocation(line: 122, column: 35, scope: !211)
!223 = !DILocation(line: 122, column: 9, scope: !211)
!224 = distinct !{!224, !214, !225, !79}
!225 = !DILocation(line: 125, column: 9, scope: !208)
!226 = !DILocation(line: 126, column: 9, scope: !194)
!227 = !DILocation(line: 126, column: 21, scope: !194)
!228 = !DILocation(line: 127, column: 20, scope: !194)
!229 = !DILocation(line: 127, column: 9, scope: !194)
!230 = !DILocation(line: 129, column: 1, scope: !170)
