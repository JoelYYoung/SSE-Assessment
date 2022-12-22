; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_04.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_04_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !32
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !35
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !36
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !37
  store i32 0, i32* %arrayidx3, align 4, !dbg !38
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i32* %arraydecay4, i32** %data, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !50, metadata !DIExpression()), !dbg !51
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !52
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #5, !dbg !53
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !54
  store i32 0, i32* %arrayidx7, align 4, !dbg !55
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  %call9 = call i64 @wcslen(i32* %arraydecay8) #6, !dbg !57
  store i64 %call9, i64* %destLen, align 8, !dbg !58
  store i64 0, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !62
  %1 = load i64, i64* %destLen, align 8, !dbg !64
  %cmp = icmp ult i64 %0, %1, !dbg !65
  br i1 %cmp, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !67
  %3 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx10 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !67
  %4 = load i32, i32* %arrayidx10, align 4, !dbg !67
  %5 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !71
  store i32 %4, i32* %arrayidx11, align 4, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !74
  %inc = add i64 %6, 1, !dbg !74
  store i64 %inc, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !79
  store i32 0, i32* %arrayidx12, align 4, !dbg !80
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !81
  call void @printWLine(i32* %arraydecay13), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_04_good() #0 !dbg !84 {
entry:
  call void @goodG2B1(), !dbg !85
  call void @goodG2B2(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !88 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !96, metadata !DIExpression()), !dbg !97
  %call = call i64 @time(i64* null) #5, !dbg !98
  %conv = trunc i64 %call to i32, !dbg !99
  call void @srand(i32 %conv) #5, !dbg !100
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !101
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_04_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_04_bad(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !108 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !115
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !116
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !117
  store i32 0, i32* %arrayidx, align 4, !dbg !118
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !119
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !120
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !121
  store i32 0, i32* %arrayidx3, align 4, !dbg !122
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !123
  store i32* %arraydecay4, i32** %data, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata i64* %i, metadata !127, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !132, metadata !DIExpression()), !dbg !133
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !134
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #5, !dbg !135
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !136
  store i32 0, i32* %arrayidx7, align 4, !dbg !137
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !138
  %call9 = call i64 @wcslen(i32* %arraydecay8) #6, !dbg !139
  store i64 %call9, i64* %destLen, align 8, !dbg !140
  store i64 0, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !143

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !144
  %1 = load i64, i64* %destLen, align 8, !dbg !146
  %cmp = icmp ult i64 %0, %1, !dbg !147
  br i1 %cmp, label %for.body, label %for.end, !dbg !148

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !149
  %3 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx10 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !149
  %4 = load i32, i32* %arrayidx10, align 4, !dbg !149
  %5 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !153
  store i32 %4, i32* %arrayidx11, align 4, !dbg !154
  br label %for.inc, !dbg !155

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !156
  %inc = add i64 %6, 1, !dbg !156
  store i64 %inc, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !157, !llvm.loop !158

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !160
  store i32 0, i32* %arrayidx12, align 4, !dbg !161
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !162
  call void @printWLine(i32* %arraydecay13), !dbg !163
  ret void, !dbg !164
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !165 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !166, metadata !DIExpression()), !dbg !167
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !168, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !170, metadata !DIExpression()), !dbg !171
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !172
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !173
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !174
  store i32 0, i32* %arrayidx, align 4, !dbg !175
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !176
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !177
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !178
  store i32 0, i32* %arrayidx3, align 4, !dbg !179
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !180
  store i32* %arraydecay4, i32** %data, align 8, !dbg !183
  call void @llvm.dbg.declare(metadata i64* %i, metadata !184, metadata !DIExpression()), !dbg !186
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !187, metadata !DIExpression()), !dbg !188
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !189, metadata !DIExpression()), !dbg !190
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !191
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #5, !dbg !192
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !193
  store i32 0, i32* %arrayidx7, align 4, !dbg !194
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !195
  %call9 = call i64 @wcslen(i32* %arraydecay8) #6, !dbg !196
  store i64 %call9, i64* %destLen, align 8, !dbg !197
  store i64 0, i64* %i, align 8, !dbg !198
  br label %for.cond, !dbg !200

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !201
  %1 = load i64, i64* %destLen, align 8, !dbg !203
  %cmp = icmp ult i64 %0, %1, !dbg !204
  br i1 %cmp, label %for.body, label %for.end, !dbg !205

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !206
  %3 = load i64, i64* %i, align 8, !dbg !208
  %arrayidx10 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !206
  %4 = load i32, i32* %arrayidx10, align 4, !dbg !206
  %5 = load i64, i64* %i, align 8, !dbg !209
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !210
  store i32 %4, i32* %arrayidx11, align 4, !dbg !211
  br label %for.inc, !dbg !212

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !213
  %inc = add i64 %6, 1, !dbg !213
  store i64 %inc, i64* %i, align 8, !dbg !213
  br label %for.cond, !dbg !214, !llvm.loop !215

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !217
  store i32 0, i32* %arrayidx12, align 4, !dbg !218
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !219
  call void @printWLine(i32* %arraydecay13), !dbg !220
  ret void, !dbg !221
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_04.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_04_bad", scope: !12, file: !12, line: 30, type: !13, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_04.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 32, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 32, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 33, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 33, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 34, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 34, column: 13, scope: !11)
!31 = !DILocation(line: 35, column: 13, scope: !11)
!32 = !DILocation(line: 35, column: 5, scope: !11)
!33 = !DILocation(line: 36, column: 5, scope: !11)
!34 = !DILocation(line: 36, column: 25, scope: !11)
!35 = !DILocation(line: 37, column: 13, scope: !11)
!36 = !DILocation(line: 37, column: 5, scope: !11)
!37 = !DILocation(line: 38, column: 5, scope: !11)
!38 = !DILocation(line: 38, column: 27, scope: !11)
!39 = !DILocation(line: 42, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !41, file: !12, line: 40, column: 5)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 39, column: 8)
!42 = !DILocation(line: 42, column: 14, scope: !40)
!43 = !DILocalVariable(name: "i", scope: !44, file: !12, line: 45, type: !45)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 44, column: 5)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !46)
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 45, column: 16, scope: !44)
!48 = !DILocalVariable(name: "destLen", scope: !44, file: !12, line: 45, type: !45)
!49 = !DILocation(line: 45, column: 19, scope: !44)
!50 = !DILocalVariable(name: "dest", scope: !44, file: !12, line: 46, type: !27)
!51 = !DILocation(line: 46, column: 17, scope: !44)
!52 = !DILocation(line: 47, column: 17, scope: !44)
!53 = !DILocation(line: 47, column: 9, scope: !44)
!54 = !DILocation(line: 48, column: 9, scope: !44)
!55 = !DILocation(line: 48, column: 21, scope: !44)
!56 = !DILocation(line: 49, column: 26, scope: !44)
!57 = !DILocation(line: 49, column: 19, scope: !44)
!58 = !DILocation(line: 49, column: 17, scope: !44)
!59 = !DILocation(line: 52, column: 16, scope: !60)
!60 = distinct !DILexicalBlock(scope: !44, file: !12, line: 52, column: 9)
!61 = !DILocation(line: 52, column: 14, scope: !60)
!62 = !DILocation(line: 52, column: 21, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !12, line: 52, column: 9)
!64 = !DILocation(line: 52, column: 25, scope: !63)
!65 = !DILocation(line: 52, column: 23, scope: !63)
!66 = !DILocation(line: 52, column: 9, scope: !60)
!67 = !DILocation(line: 54, column: 23, scope: !68)
!68 = distinct !DILexicalBlock(scope: !63, file: !12, line: 53, column: 9)
!69 = !DILocation(line: 54, column: 28, scope: !68)
!70 = !DILocation(line: 54, column: 18, scope: !68)
!71 = !DILocation(line: 54, column: 13, scope: !68)
!72 = !DILocation(line: 54, column: 21, scope: !68)
!73 = !DILocation(line: 55, column: 9, scope: !68)
!74 = !DILocation(line: 52, column: 35, scope: !63)
!75 = !DILocation(line: 52, column: 9, scope: !63)
!76 = distinct !{!76, !66, !77, !78}
!77 = !DILocation(line: 55, column: 9, scope: !60)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocation(line: 56, column: 9, scope: !44)
!80 = !DILocation(line: 56, column: 21, scope: !44)
!81 = !DILocation(line: 57, column: 20, scope: !44)
!82 = !DILocation(line: 57, column: 9, scope: !44)
!83 = !DILocation(line: 59, column: 1, scope: !11)
!84 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_04_good", scope: !12, file: !12, line: 134, type: !13, scopeLine: 135, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocation(line: 136, column: 5, scope: !84)
!86 = !DILocation(line: 137, column: 5, scope: !84)
!87 = !DILocation(line: 138, column: 1, scope: !84)
!88 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 150, type: !89, scopeLine: 151, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!19, !19, !91}
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !12, line: 150, type: !19)
!95 = !DILocation(line: 150, column: 14, scope: !88)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !12, line: 150, type: !91)
!97 = !DILocation(line: 150, column: 27, scope: !88)
!98 = !DILocation(line: 153, column: 22, scope: !88)
!99 = !DILocation(line: 153, column: 12, scope: !88)
!100 = !DILocation(line: 153, column: 5, scope: !88)
!101 = !DILocation(line: 155, column: 5, scope: !88)
!102 = !DILocation(line: 156, column: 5, scope: !88)
!103 = !DILocation(line: 157, column: 5, scope: !88)
!104 = !DILocation(line: 160, column: 5, scope: !88)
!105 = !DILocation(line: 161, column: 5, scope: !88)
!106 = !DILocation(line: 162, column: 5, scope: !88)
!107 = !DILocation(line: 164, column: 5, scope: !88)
!108 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 66, type: !13, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !12, line: 68, type: !16)
!110 = !DILocation(line: 68, column: 15, scope: !108)
!111 = !DILocalVariable(name: "dataBadBuffer", scope: !108, file: !12, line: 69, type: !22)
!112 = !DILocation(line: 69, column: 13, scope: !108)
!113 = !DILocalVariable(name: "dataGoodBuffer", scope: !108, file: !12, line: 70, type: !27)
!114 = !DILocation(line: 70, column: 13, scope: !108)
!115 = !DILocation(line: 71, column: 13, scope: !108)
!116 = !DILocation(line: 71, column: 5, scope: !108)
!117 = !DILocation(line: 72, column: 5, scope: !108)
!118 = !DILocation(line: 72, column: 25, scope: !108)
!119 = !DILocation(line: 73, column: 13, scope: !108)
!120 = !DILocation(line: 73, column: 5, scope: !108)
!121 = !DILocation(line: 74, column: 5, scope: !108)
!122 = !DILocation(line: 74, column: 27, scope: !108)
!123 = !DILocation(line: 83, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !125, file: !12, line: 81, column: 5)
!125 = distinct !DILexicalBlock(scope: !108, file: !12, line: 75, column: 8)
!126 = !DILocation(line: 83, column: 14, scope: !124)
!127 = !DILocalVariable(name: "i", scope: !128, file: !12, line: 86, type: !45)
!128 = distinct !DILexicalBlock(scope: !108, file: !12, line: 85, column: 5)
!129 = !DILocation(line: 86, column: 16, scope: !128)
!130 = !DILocalVariable(name: "destLen", scope: !128, file: !12, line: 86, type: !45)
!131 = !DILocation(line: 86, column: 19, scope: !128)
!132 = !DILocalVariable(name: "dest", scope: !128, file: !12, line: 87, type: !27)
!133 = !DILocation(line: 87, column: 17, scope: !128)
!134 = !DILocation(line: 88, column: 17, scope: !128)
!135 = !DILocation(line: 88, column: 9, scope: !128)
!136 = !DILocation(line: 89, column: 9, scope: !128)
!137 = !DILocation(line: 89, column: 21, scope: !128)
!138 = !DILocation(line: 90, column: 26, scope: !128)
!139 = !DILocation(line: 90, column: 19, scope: !128)
!140 = !DILocation(line: 90, column: 17, scope: !128)
!141 = !DILocation(line: 93, column: 16, scope: !142)
!142 = distinct !DILexicalBlock(scope: !128, file: !12, line: 93, column: 9)
!143 = !DILocation(line: 93, column: 14, scope: !142)
!144 = !DILocation(line: 93, column: 21, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !12, line: 93, column: 9)
!146 = !DILocation(line: 93, column: 25, scope: !145)
!147 = !DILocation(line: 93, column: 23, scope: !145)
!148 = !DILocation(line: 93, column: 9, scope: !142)
!149 = !DILocation(line: 95, column: 23, scope: !150)
!150 = distinct !DILexicalBlock(scope: !145, file: !12, line: 94, column: 9)
!151 = !DILocation(line: 95, column: 28, scope: !150)
!152 = !DILocation(line: 95, column: 18, scope: !150)
!153 = !DILocation(line: 95, column: 13, scope: !150)
!154 = !DILocation(line: 95, column: 21, scope: !150)
!155 = !DILocation(line: 96, column: 9, scope: !150)
!156 = !DILocation(line: 93, column: 35, scope: !145)
!157 = !DILocation(line: 93, column: 9, scope: !145)
!158 = distinct !{!158, !148, !159, !78}
!159 = !DILocation(line: 96, column: 9, scope: !142)
!160 = !DILocation(line: 97, column: 9, scope: !128)
!161 = !DILocation(line: 97, column: 21, scope: !128)
!162 = !DILocation(line: 98, column: 20, scope: !128)
!163 = !DILocation(line: 98, column: 9, scope: !128)
!164 = !DILocation(line: 100, column: 1, scope: !108)
!165 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 103, type: !13, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!166 = !DILocalVariable(name: "data", scope: !165, file: !12, line: 105, type: !16)
!167 = !DILocation(line: 105, column: 15, scope: !165)
!168 = !DILocalVariable(name: "dataBadBuffer", scope: !165, file: !12, line: 106, type: !22)
!169 = !DILocation(line: 106, column: 13, scope: !165)
!170 = !DILocalVariable(name: "dataGoodBuffer", scope: !165, file: !12, line: 107, type: !27)
!171 = !DILocation(line: 107, column: 13, scope: !165)
!172 = !DILocation(line: 108, column: 13, scope: !165)
!173 = !DILocation(line: 108, column: 5, scope: !165)
!174 = !DILocation(line: 109, column: 5, scope: !165)
!175 = !DILocation(line: 109, column: 25, scope: !165)
!176 = !DILocation(line: 110, column: 13, scope: !165)
!177 = !DILocation(line: 110, column: 5, scope: !165)
!178 = !DILocation(line: 111, column: 5, scope: !165)
!179 = !DILocation(line: 111, column: 27, scope: !165)
!180 = !DILocation(line: 115, column: 16, scope: !181)
!181 = distinct !DILexicalBlock(scope: !182, file: !12, line: 113, column: 5)
!182 = distinct !DILexicalBlock(scope: !165, file: !12, line: 112, column: 8)
!183 = !DILocation(line: 115, column: 14, scope: !181)
!184 = !DILocalVariable(name: "i", scope: !185, file: !12, line: 118, type: !45)
!185 = distinct !DILexicalBlock(scope: !165, file: !12, line: 117, column: 5)
!186 = !DILocation(line: 118, column: 16, scope: !185)
!187 = !DILocalVariable(name: "destLen", scope: !185, file: !12, line: 118, type: !45)
!188 = !DILocation(line: 118, column: 19, scope: !185)
!189 = !DILocalVariable(name: "dest", scope: !185, file: !12, line: 119, type: !27)
!190 = !DILocation(line: 119, column: 17, scope: !185)
!191 = !DILocation(line: 120, column: 17, scope: !185)
!192 = !DILocation(line: 120, column: 9, scope: !185)
!193 = !DILocation(line: 121, column: 9, scope: !185)
!194 = !DILocation(line: 121, column: 21, scope: !185)
!195 = !DILocation(line: 122, column: 26, scope: !185)
!196 = !DILocation(line: 122, column: 19, scope: !185)
!197 = !DILocation(line: 122, column: 17, scope: !185)
!198 = !DILocation(line: 125, column: 16, scope: !199)
!199 = distinct !DILexicalBlock(scope: !185, file: !12, line: 125, column: 9)
!200 = !DILocation(line: 125, column: 14, scope: !199)
!201 = !DILocation(line: 125, column: 21, scope: !202)
!202 = distinct !DILexicalBlock(scope: !199, file: !12, line: 125, column: 9)
!203 = !DILocation(line: 125, column: 25, scope: !202)
!204 = !DILocation(line: 125, column: 23, scope: !202)
!205 = !DILocation(line: 125, column: 9, scope: !199)
!206 = !DILocation(line: 127, column: 23, scope: !207)
!207 = distinct !DILexicalBlock(scope: !202, file: !12, line: 126, column: 9)
!208 = !DILocation(line: 127, column: 28, scope: !207)
!209 = !DILocation(line: 127, column: 18, scope: !207)
!210 = !DILocation(line: 127, column: 13, scope: !207)
!211 = !DILocation(line: 127, column: 21, scope: !207)
!212 = !DILocation(line: 128, column: 9, scope: !207)
!213 = !DILocation(line: 125, column: 35, scope: !202)
!214 = !DILocation(line: 125, column: 9, scope: !202)
!215 = distinct !{!215, !205, !216, !78}
!216 = !DILocation(line: 128, column: 9, scope: !199)
!217 = !DILocation(line: 129, column: 9, scope: !185)
!218 = !DILocation(line: 129, column: 21, scope: !185)
!219 = !DILocation(line: 130, column: 20, scope: !185)
!220 = !DILocation(line: 130, column: 9, scope: !185)
!221 = !DILocation(line: 132, column: 1, scope: !165)
