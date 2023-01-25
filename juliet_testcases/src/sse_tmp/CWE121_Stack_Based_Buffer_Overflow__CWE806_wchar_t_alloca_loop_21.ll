; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_21.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !12
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !15

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_21_bad() #0 !dbg !23 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 400, align 16, !dbg !30
  %1 = bitcast i8* %0 to i32*, !dbg !31
  store i32* %1, i32** %dataBuffer, align 8, !dbg !29
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  store i32* %2, i32** %data, align 8, !dbg !33
  store i32 1, i32* @badStatic, align 4, !dbg !34
  %3 = load i32*, i32** %data, align 8, !dbg !35
  %call = call i32* @badSource(i32* %3), !dbg !36
  store i32* %call, i32** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !48, metadata !DIExpression()), !dbg !49
  %5 = load i32*, i32** %data, align 8, !dbg !50
  %call1 = call i64 @wcslen(i32* %5) #6, !dbg !51
  store i64 %call1, i64* %dataLen, align 8, !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !56
  %7 = load i64, i64* %dataLen, align 8, !dbg !58
  %cmp = icmp ult i64 %6, %7, !dbg !59
  br i1 %cmp, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !61
  %9 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !61
  %10 = load i32, i32* %arrayidx, align 4, !dbg !61
  %11 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !65
  store i32 %10, i32* %arrayidx2, align 4, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %12, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !73
  store i32 0, i32* %arrayidx3, align 4, !dbg !74
  %13 = load i32*, i32** %data, align 8, !dbg !75
  call void @printWLine(i32* %13), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !78 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = load i32, i32* @badStatic, align 4, !dbg !83
  %tobool = icmp ne i32 %0, 0, !dbg !83
  br i1 %tobool, label %if.then, label %if.end, !dbg !85

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !86
  %call = call i32* @wmemset(i32* %1, i32 65, i64 99) #7, !dbg !88
  %2 = load i32*, i32** %data.addr, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !89
  store i32 0, i32* %arrayidx, align 4, !dbg !90
  br label %if.end, !dbg !91

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !92
  ret i32* %3, !dbg !93
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_21_good() #0 !dbg !94 {
entry:
  call void @goodG2B1(), !dbg !95
  call void @goodG2B2(), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !98 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !104, metadata !DIExpression()), !dbg !105
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !106, metadata !DIExpression()), !dbg !107
  %call = call i64 @time(i64* null) #7, !dbg !108
  %conv = trunc i64 %call to i32, !dbg !109
  call void @srand(i32 %conv) #7, !dbg !110
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !111
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_21_good(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !114
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_21_bad(), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !116
  ret i32 0, !dbg !117
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !118 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !121, metadata !DIExpression()), !dbg !122
  %0 = alloca i8, i64 400, align 16, !dbg !123
  %1 = bitcast i8* %0 to i32*, !dbg !124
  store i32* %1, i32** %dataBuffer, align 8, !dbg !122
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !125
  store i32* %2, i32** %data, align 8, !dbg !126
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !127
  %3 = load i32*, i32** %data, align 8, !dbg !128
  %call = call i32* @goodG2B1Source(i32* %3), !dbg !129
  store i32* %call, i32** %data, align 8, !dbg !130
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !131, metadata !DIExpression()), !dbg !133
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !133
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !133
  call void @llvm.dbg.declare(metadata i64* %i, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !136, metadata !DIExpression()), !dbg !137
  %5 = load i32*, i32** %data, align 8, !dbg !138
  %call1 = call i64 @wcslen(i32* %5) #6, !dbg !139
  store i64 %call1, i64* %dataLen, align 8, !dbg !140
  store i64 0, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !143

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !144
  %7 = load i64, i64* %dataLen, align 8, !dbg !146
  %cmp = icmp ult i64 %6, %7, !dbg !147
  br i1 %cmp, label %for.body, label %for.end, !dbg !148

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !149
  %9 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !149
  %10 = load i32, i32* %arrayidx, align 4, !dbg !149
  %11 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !153
  store i32 %10, i32* %arrayidx2, align 4, !dbg !154
  br label %for.inc, !dbg !155

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !156
  %inc = add i64 %12, 1, !dbg !156
  store i64 %inc, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !157, !llvm.loop !158

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !160
  store i32 0, i32* %arrayidx3, align 4, !dbg !161
  %13 = load i32*, i32** %data, align 8, !dbg !162
  call void @printWLine(i32* %13), !dbg !163
  ret void, !dbg !164
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B1Source(i32* %data) #0 !dbg !165 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !166, metadata !DIExpression()), !dbg !167
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !168
  %tobool = icmp ne i32 %0, 0, !dbg !168
  br i1 %tobool, label %if.then, label %if.else, !dbg !170

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !171
  br label %if.end, !dbg !173

if.else:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !174
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #7, !dbg !176
  %2 = load i32*, i32** %data.addr, align 8, !dbg !177
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !177
  store i32 0, i32* %arrayidx, align 4, !dbg !178
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !179
  ret i32* %3, !dbg !180
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !181 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !182, metadata !DIExpression()), !dbg !183
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !184, metadata !DIExpression()), !dbg !185
  %0 = alloca i8, i64 400, align 16, !dbg !186
  %1 = bitcast i8* %0 to i32*, !dbg !187
  store i32* %1, i32** %dataBuffer, align 8, !dbg !185
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !188
  store i32* %2, i32** %data, align 8, !dbg !189
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !190
  %3 = load i32*, i32** %data, align 8, !dbg !191
  %call = call i32* @goodG2B2Source(i32* %3), !dbg !192
  store i32* %call, i32** %data, align 8, !dbg !193
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !194, metadata !DIExpression()), !dbg !196
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !196
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !196
  call void @llvm.dbg.declare(metadata i64* %i, metadata !197, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !199, metadata !DIExpression()), !dbg !200
  %5 = load i32*, i32** %data, align 8, !dbg !201
  %call1 = call i64 @wcslen(i32* %5) #6, !dbg !202
  store i64 %call1, i64* %dataLen, align 8, !dbg !203
  store i64 0, i64* %i, align 8, !dbg !204
  br label %for.cond, !dbg !206

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !207
  %7 = load i64, i64* %dataLen, align 8, !dbg !209
  %cmp = icmp ult i64 %6, %7, !dbg !210
  br i1 %cmp, label %for.body, label %for.end, !dbg !211

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !212
  %9 = load i64, i64* %i, align 8, !dbg !214
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !212
  %10 = load i32, i32* %arrayidx, align 4, !dbg !212
  %11 = load i64, i64* %i, align 8, !dbg !215
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !216
  store i32 %10, i32* %arrayidx2, align 4, !dbg !217
  br label %for.inc, !dbg !218

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !219
  %inc = add i64 %12, 1, !dbg !219
  store i64 %inc, i64* %i, align 8, !dbg !219
  br label %for.cond, !dbg !220, !llvm.loop !221

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !223
  store i32 0, i32* %arrayidx3, align 4, !dbg !224
  %13 = load i32*, i32** %data, align 8, !dbg !225
  call void @printWLine(i32* %13), !dbg !226
  ret void, !dbg !227
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B2Source(i32* %data) #0 !dbg !228 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !229, metadata !DIExpression()), !dbg !230
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !231
  %tobool = icmp ne i32 %0, 0, !dbg !231
  br i1 %tobool, label %if.then, label %if.end, !dbg !233

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !234
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #7, !dbg !236
  %2 = load i32*, i32** %data.addr, align 8, !dbg !237
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !237
  store i32 0, i32* %arrayidx, align 4, !dbg !238
  br label %if.end, !dbg !239

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !240
  ret i32* %3, !dbg !241
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !14, line: 24, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12, !15}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !14, line: 63, type: !9, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_21.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !14, line: 64, type: !9, isLocal: true, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_21_bad", scope: !14, file: !14, line: 37, type: !24, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !14, line: 39, type: !6)
!27 = !DILocation(line: 39, column: 15, scope: !23)
!28 = !DILocalVariable(name: "dataBuffer", scope: !23, file: !14, line: 40, type: !6)
!29 = !DILocation(line: 40, column: 15, scope: !23)
!30 = !DILocation(line: 40, column: 39, scope: !23)
!31 = !DILocation(line: 40, column: 28, scope: !23)
!32 = !DILocation(line: 41, column: 12, scope: !23)
!33 = !DILocation(line: 41, column: 10, scope: !23)
!34 = !DILocation(line: 42, column: 15, scope: !23)
!35 = !DILocation(line: 43, column: 22, scope: !23)
!36 = !DILocation(line: 43, column: 12, scope: !23)
!37 = !DILocation(line: 43, column: 10, scope: !23)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !14, line: 45, type: !40)
!39 = distinct !DILexicalBlock(scope: !23, file: !14, line: 44, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 45, column: 17, scope: !39)
!44 = !DILocalVariable(name: "i", scope: !39, file: !14, line: 46, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !46)
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 46, column: 16, scope: !39)
!48 = !DILocalVariable(name: "dataLen", scope: !39, file: !14, line: 46, type: !45)
!49 = !DILocation(line: 46, column: 19, scope: !39)
!50 = !DILocation(line: 47, column: 26, scope: !39)
!51 = !DILocation(line: 47, column: 19, scope: !39)
!52 = !DILocation(line: 47, column: 17, scope: !39)
!53 = !DILocation(line: 49, column: 16, scope: !54)
!54 = distinct !DILexicalBlock(scope: !39, file: !14, line: 49, column: 9)
!55 = !DILocation(line: 49, column: 14, scope: !54)
!56 = !DILocation(line: 49, column: 21, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !14, line: 49, column: 9)
!58 = !DILocation(line: 49, column: 25, scope: !57)
!59 = !DILocation(line: 49, column: 23, scope: !57)
!60 = !DILocation(line: 49, column: 9, scope: !54)
!61 = !DILocation(line: 51, column: 23, scope: !62)
!62 = distinct !DILexicalBlock(scope: !57, file: !14, line: 50, column: 9)
!63 = !DILocation(line: 51, column: 28, scope: !62)
!64 = !DILocation(line: 51, column: 18, scope: !62)
!65 = !DILocation(line: 51, column: 13, scope: !62)
!66 = !DILocation(line: 51, column: 21, scope: !62)
!67 = !DILocation(line: 52, column: 9, scope: !62)
!68 = !DILocation(line: 49, column: 35, scope: !57)
!69 = !DILocation(line: 49, column: 9, scope: !57)
!70 = distinct !{!70, !60, !71, !72}
!71 = !DILocation(line: 52, column: 9, scope: !54)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 53, column: 9, scope: !39)
!74 = !DILocation(line: 53, column: 20, scope: !39)
!75 = !DILocation(line: 54, column: 20, scope: !39)
!76 = !DILocation(line: 54, column: 9, scope: !39)
!77 = !DILocation(line: 56, column: 1, scope: !23)
!78 = distinct !DISubprogram(name: "badSource", scope: !14, file: !14, line: 26, type: !79, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DISubroutineType(types: !80)
!80 = !{!6, !6}
!81 = !DILocalVariable(name: "data", arg: 1, scope: !78, file: !14, line: 26, type: !6)
!82 = !DILocation(line: 26, column: 38, scope: !78)
!83 = !DILocation(line: 28, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !78, file: !14, line: 28, column: 8)
!85 = !DILocation(line: 28, column: 8, scope: !78)
!86 = !DILocation(line: 31, column: 17, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !14, line: 29, column: 5)
!88 = !DILocation(line: 31, column: 9, scope: !87)
!89 = !DILocation(line: 32, column: 9, scope: !87)
!90 = !DILocation(line: 32, column: 21, scope: !87)
!91 = !DILocation(line: 33, column: 5, scope: !87)
!92 = !DILocation(line: 34, column: 12, scope: !78)
!93 = !DILocation(line: 34, column: 5, scope: !78)
!94 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_21_good", scope: !14, file: !14, line: 137, type: !24, scopeLine: 138, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!95 = !DILocation(line: 139, column: 5, scope: !94)
!96 = !DILocation(line: 140, column: 5, scope: !94)
!97 = !DILocation(line: 141, column: 1, scope: !94)
!98 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 153, type: !99, scopeLine: 154, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!99 = !DISubroutineType(types: !100)
!100 = !{!9, !9, !101}
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!104 = !DILocalVariable(name: "argc", arg: 1, scope: !98, file: !14, line: 153, type: !9)
!105 = !DILocation(line: 153, column: 14, scope: !98)
!106 = !DILocalVariable(name: "argv", arg: 2, scope: !98, file: !14, line: 153, type: !101)
!107 = !DILocation(line: 153, column: 27, scope: !98)
!108 = !DILocation(line: 156, column: 22, scope: !98)
!109 = !DILocation(line: 156, column: 12, scope: !98)
!110 = !DILocation(line: 156, column: 5, scope: !98)
!111 = !DILocation(line: 158, column: 5, scope: !98)
!112 = !DILocation(line: 159, column: 5, scope: !98)
!113 = !DILocation(line: 160, column: 5, scope: !98)
!114 = !DILocation(line: 163, column: 5, scope: !98)
!115 = !DILocation(line: 164, column: 5, scope: !98)
!116 = !DILocation(line: 165, column: 5, scope: !98)
!117 = !DILocation(line: 167, column: 5, scope: !98)
!118 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 83, type: !24, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!119 = !DILocalVariable(name: "data", scope: !118, file: !14, line: 85, type: !6)
!120 = !DILocation(line: 85, column: 15, scope: !118)
!121 = !DILocalVariable(name: "dataBuffer", scope: !118, file: !14, line: 86, type: !6)
!122 = !DILocation(line: 86, column: 15, scope: !118)
!123 = !DILocation(line: 86, column: 39, scope: !118)
!124 = !DILocation(line: 86, column: 28, scope: !118)
!125 = !DILocation(line: 87, column: 12, scope: !118)
!126 = !DILocation(line: 87, column: 10, scope: !118)
!127 = !DILocation(line: 88, column: 20, scope: !118)
!128 = !DILocation(line: 89, column: 27, scope: !118)
!129 = !DILocation(line: 89, column: 12, scope: !118)
!130 = !DILocation(line: 89, column: 10, scope: !118)
!131 = !DILocalVariable(name: "dest", scope: !132, file: !14, line: 91, type: !40)
!132 = distinct !DILexicalBlock(scope: !118, file: !14, line: 90, column: 5)
!133 = !DILocation(line: 91, column: 17, scope: !132)
!134 = !DILocalVariable(name: "i", scope: !132, file: !14, line: 92, type: !45)
!135 = !DILocation(line: 92, column: 16, scope: !132)
!136 = !DILocalVariable(name: "dataLen", scope: !132, file: !14, line: 92, type: !45)
!137 = !DILocation(line: 92, column: 19, scope: !132)
!138 = !DILocation(line: 93, column: 26, scope: !132)
!139 = !DILocation(line: 93, column: 19, scope: !132)
!140 = !DILocation(line: 93, column: 17, scope: !132)
!141 = !DILocation(line: 95, column: 16, scope: !142)
!142 = distinct !DILexicalBlock(scope: !132, file: !14, line: 95, column: 9)
!143 = !DILocation(line: 95, column: 14, scope: !142)
!144 = !DILocation(line: 95, column: 21, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !14, line: 95, column: 9)
!146 = !DILocation(line: 95, column: 25, scope: !145)
!147 = !DILocation(line: 95, column: 23, scope: !145)
!148 = !DILocation(line: 95, column: 9, scope: !142)
!149 = !DILocation(line: 97, column: 23, scope: !150)
!150 = distinct !DILexicalBlock(scope: !145, file: !14, line: 96, column: 9)
!151 = !DILocation(line: 97, column: 28, scope: !150)
!152 = !DILocation(line: 97, column: 18, scope: !150)
!153 = !DILocation(line: 97, column: 13, scope: !150)
!154 = !DILocation(line: 97, column: 21, scope: !150)
!155 = !DILocation(line: 98, column: 9, scope: !150)
!156 = !DILocation(line: 95, column: 35, scope: !145)
!157 = !DILocation(line: 95, column: 9, scope: !145)
!158 = distinct !{!158, !148, !159, !72}
!159 = !DILocation(line: 98, column: 9, scope: !142)
!160 = !DILocation(line: 99, column: 9, scope: !132)
!161 = !DILocation(line: 99, column: 20, scope: !132)
!162 = !DILocation(line: 100, column: 20, scope: !132)
!163 = !DILocation(line: 100, column: 9, scope: !132)
!164 = !DILocation(line: 102, column: 1, scope: !118)
!165 = distinct !DISubprogram(name: "goodG2B1Source", scope: !14, file: !14, line: 67, type: !79, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!166 = !DILocalVariable(name: "data", arg: 1, scope: !165, file: !14, line: 67, type: !6)
!167 = !DILocation(line: 67, column: 43, scope: !165)
!168 = !DILocation(line: 69, column: 8, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !14, line: 69, column: 8)
!170 = !DILocation(line: 69, column: 8, scope: !165)
!171 = !DILocation(line: 72, column: 9, scope: !172)
!172 = distinct !DILexicalBlock(scope: !169, file: !14, line: 70, column: 5)
!173 = !DILocation(line: 73, column: 5, scope: !172)
!174 = !DILocation(line: 77, column: 17, scope: !175)
!175 = distinct !DILexicalBlock(scope: !169, file: !14, line: 75, column: 5)
!176 = !DILocation(line: 77, column: 9, scope: !175)
!177 = !DILocation(line: 78, column: 9, scope: !175)
!178 = !DILocation(line: 78, column: 20, scope: !175)
!179 = !DILocation(line: 80, column: 12, scope: !165)
!180 = !DILocation(line: 80, column: 5, scope: !165)
!181 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 116, type: !24, scopeLine: 117, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!182 = !DILocalVariable(name: "data", scope: !181, file: !14, line: 118, type: !6)
!183 = !DILocation(line: 118, column: 15, scope: !181)
!184 = !DILocalVariable(name: "dataBuffer", scope: !181, file: !14, line: 119, type: !6)
!185 = !DILocation(line: 119, column: 15, scope: !181)
!186 = !DILocation(line: 119, column: 39, scope: !181)
!187 = !DILocation(line: 119, column: 28, scope: !181)
!188 = !DILocation(line: 120, column: 12, scope: !181)
!189 = !DILocation(line: 120, column: 10, scope: !181)
!190 = !DILocation(line: 121, column: 20, scope: !181)
!191 = !DILocation(line: 122, column: 27, scope: !181)
!192 = !DILocation(line: 122, column: 12, scope: !181)
!193 = !DILocation(line: 122, column: 10, scope: !181)
!194 = !DILocalVariable(name: "dest", scope: !195, file: !14, line: 124, type: !40)
!195 = distinct !DILexicalBlock(scope: !181, file: !14, line: 123, column: 5)
!196 = !DILocation(line: 124, column: 17, scope: !195)
!197 = !DILocalVariable(name: "i", scope: !195, file: !14, line: 125, type: !45)
!198 = !DILocation(line: 125, column: 16, scope: !195)
!199 = !DILocalVariable(name: "dataLen", scope: !195, file: !14, line: 125, type: !45)
!200 = !DILocation(line: 125, column: 19, scope: !195)
!201 = !DILocation(line: 126, column: 26, scope: !195)
!202 = !DILocation(line: 126, column: 19, scope: !195)
!203 = !DILocation(line: 126, column: 17, scope: !195)
!204 = !DILocation(line: 128, column: 16, scope: !205)
!205 = distinct !DILexicalBlock(scope: !195, file: !14, line: 128, column: 9)
!206 = !DILocation(line: 128, column: 14, scope: !205)
!207 = !DILocation(line: 128, column: 21, scope: !208)
!208 = distinct !DILexicalBlock(scope: !205, file: !14, line: 128, column: 9)
!209 = !DILocation(line: 128, column: 25, scope: !208)
!210 = !DILocation(line: 128, column: 23, scope: !208)
!211 = !DILocation(line: 128, column: 9, scope: !205)
!212 = !DILocation(line: 130, column: 23, scope: !213)
!213 = distinct !DILexicalBlock(scope: !208, file: !14, line: 129, column: 9)
!214 = !DILocation(line: 130, column: 28, scope: !213)
!215 = !DILocation(line: 130, column: 18, scope: !213)
!216 = !DILocation(line: 130, column: 13, scope: !213)
!217 = !DILocation(line: 130, column: 21, scope: !213)
!218 = !DILocation(line: 131, column: 9, scope: !213)
!219 = !DILocation(line: 128, column: 35, scope: !208)
!220 = !DILocation(line: 128, column: 9, scope: !208)
!221 = distinct !{!221, !211, !222, !72}
!222 = !DILocation(line: 131, column: 9, scope: !205)
!223 = !DILocation(line: 132, column: 9, scope: !195)
!224 = !DILocation(line: 132, column: 20, scope: !195)
!225 = !DILocation(line: 133, column: 20, scope: !195)
!226 = !DILocation(line: 133, column: 9, scope: !195)
!227 = !DILocation(line: 135, column: 1, scope: !181)
!228 = distinct !DISubprogram(name: "goodG2B2Source", scope: !14, file: !14, line: 105, type: !79, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!229 = !DILocalVariable(name: "data", arg: 1, scope: !228, file: !14, line: 105, type: !6)
!230 = !DILocation(line: 105, column: 43, scope: !228)
!231 = !DILocation(line: 107, column: 8, scope: !232)
!232 = distinct !DILexicalBlock(scope: !228, file: !14, line: 107, column: 8)
!233 = !DILocation(line: 107, column: 8, scope: !228)
!234 = !DILocation(line: 110, column: 17, scope: !235)
!235 = distinct !DILexicalBlock(scope: !232, file: !14, line: 108, column: 5)
!236 = !DILocation(line: 110, column: 9, scope: !235)
!237 = !DILocation(line: 111, column: 9, scope: !235)
!238 = !DILocation(line: 111, column: 20, scope: !235)
!239 = !DILocation(line: 112, column: 5, scope: !235)
!240 = !DILocation(line: 113, column: 12, scope: !228)
!241 = !DILocation(line: 113, column: 5, scope: !228)
