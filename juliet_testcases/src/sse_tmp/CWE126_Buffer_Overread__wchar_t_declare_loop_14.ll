; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_14.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_14_bad() #0 !dbg !11 {
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
  %0 = load i32, i32* @globalFive, align 4, !dbg !39
  %cmp = icmp eq i32 %0, 5, !dbg !41
  br i1 %cmp, label %if.then, label %if.end, !dbg !42

if.then:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !43
  store i32* %arraydecay4, i32** %data, align 8, !dbg !45
  br label %if.end, !dbg !46

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !54, metadata !DIExpression()), !dbg !55
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #5, !dbg !57
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx7, align 4, !dbg !59
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  %call9 = call i64 @wcslen(i32* %arraydecay8) #6, !dbg !61
  store i64 %call9, i64* %destLen, align 8, !dbg !62
  store i64 0, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !66
  %2 = load i64, i64* %destLen, align 8, !dbg !68
  %cmp10 = icmp ult i64 %1, %2, !dbg !69
  br i1 %cmp10, label %for.body, label %for.end, !dbg !70

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !71
  %4 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx11 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !71
  %5 = load i32, i32* %arrayidx11, align 4, !dbg !71
  %6 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !75
  store i32 %5, i32* %arrayidx12, align 4, !dbg !76
  br label %for.inc, !dbg !77

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !78
  %inc = add i64 %7, 1, !dbg !78
  store i64 %inc, i64* %i, align 8, !dbg !78
  br label %for.cond, !dbg !79, !llvm.loop !80

for.end:                                          ; preds = %for.cond
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !83
  store i32 0, i32* %arrayidx13, align 4, !dbg !84
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !85
  call void @printWLine(i32* %arraydecay14), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_14_good() #0 !dbg !88 {
entry:
  call void @goodG2B1(), !dbg !89
  call void @goodG2B2(), !dbg !90
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
  %call = call i64 @time(i64* null) #5, !dbg !102
  %conv = trunc i64 %call to i32, !dbg !103
  call void @srand(i32 %conv) #5, !dbg !104
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !105
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_14_good(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_14_bad(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !112 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !119
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !120
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !121
  store i32 0, i32* %arrayidx, align 4, !dbg !122
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !123
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !124
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !125
  store i32 0, i32* %arrayidx3, align 4, !dbg !126
  %0 = load i32, i32* @globalFive, align 4, !dbg !127
  %cmp = icmp ne i32 %0, 5, !dbg !129
  br i1 %cmp, label %if.then, label %if.else, !dbg !130

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !131
  br label %if.end, !dbg !133

if.else:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !134
  store i32* %arraydecay4, i32** %data, align 8, !dbg !136
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !137, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !142, metadata !DIExpression()), !dbg !143
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !144
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #5, !dbg !145
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !146
  store i32 0, i32* %arrayidx7, align 4, !dbg !147
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !148
  %call9 = call i64 @wcslen(i32* %arraydecay8) #6, !dbg !149
  store i64 %call9, i64* %destLen, align 8, !dbg !150
  store i64 0, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !153

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !154
  %2 = load i64, i64* %destLen, align 8, !dbg !156
  %cmp10 = icmp ult i64 %1, %2, !dbg !157
  br i1 %cmp10, label %for.body, label %for.end, !dbg !158

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !159
  %4 = load i64, i64* %i, align 8, !dbg !161
  %arrayidx11 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !159
  %5 = load i32, i32* %arrayidx11, align 4, !dbg !159
  %6 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !163
  store i32 %5, i32* %arrayidx12, align 4, !dbg !164
  br label %for.inc, !dbg !165

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !166
  %inc = add i64 %7, 1, !dbg !166
  store i64 %inc, i64* %i, align 8, !dbg !166
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end:                                          ; preds = %for.cond
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !170
  store i32 0, i32* %arrayidx13, align 4, !dbg !171
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !172
  call void @printWLine(i32* %arraydecay14), !dbg !173
  ret void, !dbg !174
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !175 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !176, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !178, metadata !DIExpression()), !dbg !179
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !180, metadata !DIExpression()), !dbg !181
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !182
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !183
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !184
  store i32 0, i32* %arrayidx, align 4, !dbg !185
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !186
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !187
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !188
  store i32 0, i32* %arrayidx3, align 4, !dbg !189
  %0 = load i32, i32* @globalFive, align 4, !dbg !190
  %cmp = icmp eq i32 %0, 5, !dbg !192
  br i1 %cmp, label %if.then, label %if.end, !dbg !193

if.then:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !194
  store i32* %arraydecay4, i32** %data, align 8, !dbg !196
  br label %if.end, !dbg !197

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !198, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !201, metadata !DIExpression()), !dbg !202
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !203, metadata !DIExpression()), !dbg !204
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !205
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #5, !dbg !206
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !207
  store i32 0, i32* %arrayidx7, align 4, !dbg !208
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !209
  %call9 = call i64 @wcslen(i32* %arraydecay8) #6, !dbg !210
  store i64 %call9, i64* %destLen, align 8, !dbg !211
  store i64 0, i64* %i, align 8, !dbg !212
  br label %for.cond, !dbg !214

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !215
  %2 = load i64, i64* %destLen, align 8, !dbg !217
  %cmp10 = icmp ult i64 %1, %2, !dbg !218
  br i1 %cmp10, label %for.body, label %for.end, !dbg !219

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !220
  %4 = load i64, i64* %i, align 8, !dbg !222
  %arrayidx11 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !220
  %5 = load i32, i32* %arrayidx11, align 4, !dbg !220
  %6 = load i64, i64* %i, align 8, !dbg !223
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !224
  store i32 %5, i32* %arrayidx12, align 4, !dbg !225
  br label %for.inc, !dbg !226

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !227
  %inc = add i64 %7, 1, !dbg !227
  store i64 %inc, i64* %i, align 8, !dbg !227
  br label %for.cond, !dbg !228, !llvm.loop !229

for.end:                                          ; preds = %for.cond
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !231
  store i32 0, i32* %arrayidx13, align 4, !dbg !232
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !233
  call void @printWLine(i32* %arraydecay14), !dbg !234
  ret void, !dbg !235
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_14.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_14_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_14.c", directory: "/home/joelyang/SSE-Assessment")
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
!31 = !DILocation(line: 28, column: 13, scope: !11)
!32 = !DILocation(line: 28, column: 5, scope: !11)
!33 = !DILocation(line: 29, column: 5, scope: !11)
!34 = !DILocation(line: 29, column: 25, scope: !11)
!35 = !DILocation(line: 30, column: 13, scope: !11)
!36 = !DILocation(line: 30, column: 5, scope: !11)
!37 = !DILocation(line: 31, column: 5, scope: !11)
!38 = !DILocation(line: 31, column: 27, scope: !11)
!39 = !DILocation(line: 32, column: 8, scope: !40)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 8)
!41 = !DILocation(line: 32, column: 18, scope: !40)
!42 = !DILocation(line: 32, column: 8, scope: !11)
!43 = !DILocation(line: 35, column: 16, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !12, line: 33, column: 5)
!45 = !DILocation(line: 35, column: 14, scope: !44)
!46 = !DILocation(line: 36, column: 5, scope: !44)
!47 = !DILocalVariable(name: "i", scope: !48, file: !12, line: 38, type: !49)
!48 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !50)
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 38, column: 16, scope: !48)
!52 = !DILocalVariable(name: "destLen", scope: !48, file: !12, line: 38, type: !49)
!53 = !DILocation(line: 38, column: 19, scope: !48)
!54 = !DILocalVariable(name: "dest", scope: !48, file: !12, line: 39, type: !27)
!55 = !DILocation(line: 39, column: 17, scope: !48)
!56 = !DILocation(line: 40, column: 17, scope: !48)
!57 = !DILocation(line: 40, column: 9, scope: !48)
!58 = !DILocation(line: 41, column: 9, scope: !48)
!59 = !DILocation(line: 41, column: 21, scope: !48)
!60 = !DILocation(line: 42, column: 26, scope: !48)
!61 = !DILocation(line: 42, column: 19, scope: !48)
!62 = !DILocation(line: 42, column: 17, scope: !48)
!63 = !DILocation(line: 45, column: 16, scope: !64)
!64 = distinct !DILexicalBlock(scope: !48, file: !12, line: 45, column: 9)
!65 = !DILocation(line: 45, column: 14, scope: !64)
!66 = !DILocation(line: 45, column: 21, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !12, line: 45, column: 9)
!68 = !DILocation(line: 45, column: 25, scope: !67)
!69 = !DILocation(line: 45, column: 23, scope: !67)
!70 = !DILocation(line: 45, column: 9, scope: !64)
!71 = !DILocation(line: 47, column: 23, scope: !72)
!72 = distinct !DILexicalBlock(scope: !67, file: !12, line: 46, column: 9)
!73 = !DILocation(line: 47, column: 28, scope: !72)
!74 = !DILocation(line: 47, column: 18, scope: !72)
!75 = !DILocation(line: 47, column: 13, scope: !72)
!76 = !DILocation(line: 47, column: 21, scope: !72)
!77 = !DILocation(line: 48, column: 9, scope: !72)
!78 = !DILocation(line: 45, column: 35, scope: !67)
!79 = !DILocation(line: 45, column: 9, scope: !67)
!80 = distinct !{!80, !70, !81, !82}
!81 = !DILocation(line: 48, column: 9, scope: !64)
!82 = !{!"llvm.loop.mustprogress"}
!83 = !DILocation(line: 49, column: 9, scope: !48)
!84 = !DILocation(line: 49, column: 21, scope: !48)
!85 = !DILocation(line: 50, column: 20, scope: !48)
!86 = !DILocation(line: 50, column: 9, scope: !48)
!87 = !DILocation(line: 52, column: 1, scope: !11)
!88 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_14_good", scope: !12, file: !12, line: 127, type: !13, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocation(line: 129, column: 5, scope: !88)
!90 = !DILocation(line: 130, column: 5, scope: !88)
!91 = !DILocation(line: 131, column: 1, scope: !88)
!92 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 143, type: !93, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DISubroutineType(types: !94)
!94 = !{!19, !19, !95}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !12, line: 143, type: !19)
!99 = !DILocation(line: 143, column: 14, scope: !92)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !12, line: 143, type: !95)
!101 = !DILocation(line: 143, column: 27, scope: !92)
!102 = !DILocation(line: 146, column: 22, scope: !92)
!103 = !DILocation(line: 146, column: 12, scope: !92)
!104 = !DILocation(line: 146, column: 5, scope: !92)
!105 = !DILocation(line: 148, column: 5, scope: !92)
!106 = !DILocation(line: 149, column: 5, scope: !92)
!107 = !DILocation(line: 150, column: 5, scope: !92)
!108 = !DILocation(line: 153, column: 5, scope: !92)
!109 = !DILocation(line: 154, column: 5, scope: !92)
!110 = !DILocation(line: 155, column: 5, scope: !92)
!111 = !DILocation(line: 157, column: 5, scope: !92)
!112 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", scope: !112, file: !12, line: 61, type: !16)
!114 = !DILocation(line: 61, column: 15, scope: !112)
!115 = !DILocalVariable(name: "dataBadBuffer", scope: !112, file: !12, line: 62, type: !22)
!116 = !DILocation(line: 62, column: 13, scope: !112)
!117 = !DILocalVariable(name: "dataGoodBuffer", scope: !112, file: !12, line: 63, type: !27)
!118 = !DILocation(line: 63, column: 13, scope: !112)
!119 = !DILocation(line: 64, column: 13, scope: !112)
!120 = !DILocation(line: 64, column: 5, scope: !112)
!121 = !DILocation(line: 65, column: 5, scope: !112)
!122 = !DILocation(line: 65, column: 25, scope: !112)
!123 = !DILocation(line: 66, column: 13, scope: !112)
!124 = !DILocation(line: 66, column: 5, scope: !112)
!125 = !DILocation(line: 67, column: 5, scope: !112)
!126 = !DILocation(line: 67, column: 27, scope: !112)
!127 = !DILocation(line: 68, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !112, file: !12, line: 68, column: 8)
!129 = !DILocation(line: 68, column: 18, scope: !128)
!130 = !DILocation(line: 68, column: 8, scope: !112)
!131 = !DILocation(line: 71, column: 9, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !12, line: 69, column: 5)
!133 = !DILocation(line: 72, column: 5, scope: !132)
!134 = !DILocation(line: 76, column: 16, scope: !135)
!135 = distinct !DILexicalBlock(scope: !128, file: !12, line: 74, column: 5)
!136 = !DILocation(line: 76, column: 14, scope: !135)
!137 = !DILocalVariable(name: "i", scope: !138, file: !12, line: 79, type: !49)
!138 = distinct !DILexicalBlock(scope: !112, file: !12, line: 78, column: 5)
!139 = !DILocation(line: 79, column: 16, scope: !138)
!140 = !DILocalVariable(name: "destLen", scope: !138, file: !12, line: 79, type: !49)
!141 = !DILocation(line: 79, column: 19, scope: !138)
!142 = !DILocalVariable(name: "dest", scope: !138, file: !12, line: 80, type: !27)
!143 = !DILocation(line: 80, column: 17, scope: !138)
!144 = !DILocation(line: 81, column: 17, scope: !138)
!145 = !DILocation(line: 81, column: 9, scope: !138)
!146 = !DILocation(line: 82, column: 9, scope: !138)
!147 = !DILocation(line: 82, column: 21, scope: !138)
!148 = !DILocation(line: 83, column: 26, scope: !138)
!149 = !DILocation(line: 83, column: 19, scope: !138)
!150 = !DILocation(line: 83, column: 17, scope: !138)
!151 = !DILocation(line: 86, column: 16, scope: !152)
!152 = distinct !DILexicalBlock(scope: !138, file: !12, line: 86, column: 9)
!153 = !DILocation(line: 86, column: 14, scope: !152)
!154 = !DILocation(line: 86, column: 21, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !12, line: 86, column: 9)
!156 = !DILocation(line: 86, column: 25, scope: !155)
!157 = !DILocation(line: 86, column: 23, scope: !155)
!158 = !DILocation(line: 86, column: 9, scope: !152)
!159 = !DILocation(line: 88, column: 23, scope: !160)
!160 = distinct !DILexicalBlock(scope: !155, file: !12, line: 87, column: 9)
!161 = !DILocation(line: 88, column: 28, scope: !160)
!162 = !DILocation(line: 88, column: 18, scope: !160)
!163 = !DILocation(line: 88, column: 13, scope: !160)
!164 = !DILocation(line: 88, column: 21, scope: !160)
!165 = !DILocation(line: 89, column: 9, scope: !160)
!166 = !DILocation(line: 86, column: 35, scope: !155)
!167 = !DILocation(line: 86, column: 9, scope: !155)
!168 = distinct !{!168, !158, !169, !82}
!169 = !DILocation(line: 89, column: 9, scope: !152)
!170 = !DILocation(line: 90, column: 9, scope: !138)
!171 = !DILocation(line: 90, column: 21, scope: !138)
!172 = !DILocation(line: 91, column: 20, scope: !138)
!173 = !DILocation(line: 91, column: 9, scope: !138)
!174 = !DILocation(line: 93, column: 1, scope: !112)
!175 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 96, type: !13, scopeLine: 97, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!176 = !DILocalVariable(name: "data", scope: !175, file: !12, line: 98, type: !16)
!177 = !DILocation(line: 98, column: 15, scope: !175)
!178 = !DILocalVariable(name: "dataBadBuffer", scope: !175, file: !12, line: 99, type: !22)
!179 = !DILocation(line: 99, column: 13, scope: !175)
!180 = !DILocalVariable(name: "dataGoodBuffer", scope: !175, file: !12, line: 100, type: !27)
!181 = !DILocation(line: 100, column: 13, scope: !175)
!182 = !DILocation(line: 101, column: 13, scope: !175)
!183 = !DILocation(line: 101, column: 5, scope: !175)
!184 = !DILocation(line: 102, column: 5, scope: !175)
!185 = !DILocation(line: 102, column: 25, scope: !175)
!186 = !DILocation(line: 103, column: 13, scope: !175)
!187 = !DILocation(line: 103, column: 5, scope: !175)
!188 = !DILocation(line: 104, column: 5, scope: !175)
!189 = !DILocation(line: 104, column: 27, scope: !175)
!190 = !DILocation(line: 105, column: 8, scope: !191)
!191 = distinct !DILexicalBlock(scope: !175, file: !12, line: 105, column: 8)
!192 = !DILocation(line: 105, column: 18, scope: !191)
!193 = !DILocation(line: 105, column: 8, scope: !175)
!194 = !DILocation(line: 108, column: 16, scope: !195)
!195 = distinct !DILexicalBlock(scope: !191, file: !12, line: 106, column: 5)
!196 = !DILocation(line: 108, column: 14, scope: !195)
!197 = !DILocation(line: 109, column: 5, scope: !195)
!198 = !DILocalVariable(name: "i", scope: !199, file: !12, line: 111, type: !49)
!199 = distinct !DILexicalBlock(scope: !175, file: !12, line: 110, column: 5)
!200 = !DILocation(line: 111, column: 16, scope: !199)
!201 = !DILocalVariable(name: "destLen", scope: !199, file: !12, line: 111, type: !49)
!202 = !DILocation(line: 111, column: 19, scope: !199)
!203 = !DILocalVariable(name: "dest", scope: !199, file: !12, line: 112, type: !27)
!204 = !DILocation(line: 112, column: 17, scope: !199)
!205 = !DILocation(line: 113, column: 17, scope: !199)
!206 = !DILocation(line: 113, column: 9, scope: !199)
!207 = !DILocation(line: 114, column: 9, scope: !199)
!208 = !DILocation(line: 114, column: 21, scope: !199)
!209 = !DILocation(line: 115, column: 26, scope: !199)
!210 = !DILocation(line: 115, column: 19, scope: !199)
!211 = !DILocation(line: 115, column: 17, scope: !199)
!212 = !DILocation(line: 118, column: 16, scope: !213)
!213 = distinct !DILexicalBlock(scope: !199, file: !12, line: 118, column: 9)
!214 = !DILocation(line: 118, column: 14, scope: !213)
!215 = !DILocation(line: 118, column: 21, scope: !216)
!216 = distinct !DILexicalBlock(scope: !213, file: !12, line: 118, column: 9)
!217 = !DILocation(line: 118, column: 25, scope: !216)
!218 = !DILocation(line: 118, column: 23, scope: !216)
!219 = !DILocation(line: 118, column: 9, scope: !213)
!220 = !DILocation(line: 120, column: 23, scope: !221)
!221 = distinct !DILexicalBlock(scope: !216, file: !12, line: 119, column: 9)
!222 = !DILocation(line: 120, column: 28, scope: !221)
!223 = !DILocation(line: 120, column: 18, scope: !221)
!224 = !DILocation(line: 120, column: 13, scope: !221)
!225 = !DILocation(line: 120, column: 21, scope: !221)
!226 = !DILocation(line: 121, column: 9, scope: !221)
!227 = !DILocation(line: 118, column: 35, scope: !216)
!228 = !DILocation(line: 118, column: 9, scope: !216)
!229 = distinct !{!229, !219, !230, !82}
!230 = !DILocation(line: 121, column: 9, scope: !213)
!231 = !DILocation(line: 122, column: 9, scope: !199)
!232 = !DILocation(line: 122, column: 21, scope: !199)
!233 = !DILocation(line: 123, column: 20, scope: !199)
!234 = !DILocation(line: 123, column: 9, scope: !199)
!235 = !DILocation(line: 125, column: 1, scope: !175)
