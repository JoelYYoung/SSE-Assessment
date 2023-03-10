; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_21.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !11
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !15

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_loop_21_bad() #0 !dbg !23 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i8* null, i8** %data, align 8, !dbg !28
  store i32 1, i32* @badStatic, align 4, !dbg !29
  %0 = load i8*, i8** %data, align 8, !dbg !30
  %call = call i8* @badSource(i8* %0), !dbg !31
  store i8* %call, i8** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !39, metadata !DIExpression()), !dbg !43
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !44
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !45
  store i8 0, i8* %arrayidx, align 1, !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !50
  %cmp = icmp ult i64 %1, 100, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !56
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !56
  %4 = load i8*, i8** %data, align 8, !dbg !57
  %5 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !57
  store i8 %3, i8* %arrayidx2, align 1, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %6, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !66
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !66
  store i8 0, i8* %arrayidx3, align 1, !dbg !67
  %8 = load i8*, i8** %data, align 8, !dbg !68
  call void @printLine(i8* %8), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !71 {
entry:
  %data.addr = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %0 = load i32, i32* @badStatic, align 4, !dbg !76
  %tobool = icmp ne i32 %0, 0, !dbg !76
  br i1 %tobool, label %if.then, label %if.end2, !dbg !78

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !82
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !83
  store i8* %call, i8** %dataBuffer, align 8, !dbg !82
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !84
  %cmp = icmp eq i8* %1, null, !dbg !86
  br i1 %cmp, label %if.then1, label %if.end, !dbg !87

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !88
  unreachable, !dbg !88

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !91
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !92
  store i8 0, i8* %arrayidx, align 1, !dbg !93
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !94
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 -8, !dbg !95
  store i8* %add.ptr, i8** %data.addr, align 8, !dbg !96
  br label %if.end2, !dbg !97

if.end2:                                          ; preds = %if.end, %entry
  %5 = load i8*, i8** %data.addr, align 8, !dbg !98
  ret i8* %5, !dbg !99
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_loop_21_good() #0 !dbg !100 {
entry:
  call void @goodG2B1(), !dbg !101
  call void @goodG2B2(), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !104 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !108, metadata !DIExpression()), !dbg !109
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !110, metadata !DIExpression()), !dbg !111
  %call = call i64 @time(i64* null) #6, !dbg !112
  %conv = trunc i64 %call to i32, !dbg !113
  call void @srand(i32 %conv) #6, !dbg !114
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !115
  call void @CWE124_Buffer_Underwrite__malloc_char_loop_21_good(), !dbg !116
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !117
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !118
  call void @CWE124_Buffer_Underwrite__malloc_char_loop_21_bad(), !dbg !119
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !120
  ret i32 0, !dbg !121
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #4

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !122 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !123, metadata !DIExpression()), !dbg !124
  store i8* null, i8** %data, align 8, !dbg !125
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !126
  %0 = load i8*, i8** %data, align 8, !dbg !127
  %call = call i8* @goodG2B1Source(i8* %0), !dbg !128
  store i8* %call, i8** %data, align 8, !dbg !129
  call void @llvm.dbg.declare(metadata i64* %i, metadata !130, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !133, metadata !DIExpression()), !dbg !134
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !135
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !135
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !136
  store i8 0, i8* %arrayidx, align 1, !dbg !137
  store i64 0, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !141
  %cmp = icmp ult i64 %1, 100, !dbg !143
  br i1 %cmp, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !147
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !147
  %4 = load i8*, i8** %data, align 8, !dbg !148
  %5 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !148
  store i8 %3, i8* %arrayidx2, align 1, !dbg !150
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !152
  %inc = add i64 %6, 1, !dbg !152
  store i64 %inc, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !153, !llvm.loop !154

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !156
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !156
  store i8 0, i8* %arrayidx3, align 1, !dbg !157
  %8 = load i8*, i8** %data, align 8, !dbg !158
  call void @printLine(i8* %8), !dbg !159
  ret void, !dbg !160
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B1Source(i8* %data) #0 !dbg !161 {
entry:
  %data.addr = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !162, metadata !DIExpression()), !dbg !163
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !164
  %tobool = icmp ne i32 %0, 0, !dbg !164
  br i1 %tobool, label %if.then, label %if.else, !dbg !166

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !167
  br label %if.end2, !dbg !169

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !170, metadata !DIExpression()), !dbg !173
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !174
  store i8* %call, i8** %dataBuffer, align 8, !dbg !173
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !175
  %cmp = icmp eq i8* %1, null, !dbg !177
  br i1 %cmp, label %if.then1, label %if.end, !dbg !178

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !179
  unreachable, !dbg !179

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !181
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !182
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !183
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !183
  store i8 0, i8* %arrayidx, align 1, !dbg !184
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !185
  store i8* %4, i8** %data.addr, align 8, !dbg !186
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %5 = load i8*, i8** %data.addr, align 8, !dbg !187
  ret i8* %5, !dbg !188
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !189 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !190, metadata !DIExpression()), !dbg !191
  store i8* null, i8** %data, align 8, !dbg !192
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !193
  %0 = load i8*, i8** %data, align 8, !dbg !194
  %call = call i8* @goodG2B2Source(i8* %0), !dbg !195
  store i8* %call, i8** %data, align 8, !dbg !196
  call void @llvm.dbg.declare(metadata i64* %i, metadata !197, metadata !DIExpression()), !dbg !199
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !200, metadata !DIExpression()), !dbg !201
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !202
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !202
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !203
  store i8 0, i8* %arrayidx, align 1, !dbg !204
  store i64 0, i64* %i, align 8, !dbg !205
  br label %for.cond, !dbg !207

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !208
  %cmp = icmp ult i64 %1, 100, !dbg !210
  br i1 %cmp, label %for.body, label %for.end, !dbg !211

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !212
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !214
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !214
  %4 = load i8*, i8** %data, align 8, !dbg !215
  %5 = load i64, i64* %i, align 8, !dbg !216
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !215
  store i8 %3, i8* %arrayidx2, align 1, !dbg !217
  br label %for.inc, !dbg !218

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !219
  %inc = add i64 %6, 1, !dbg !219
  store i64 %inc, i64* %i, align 8, !dbg !219
  br label %for.cond, !dbg !220, !llvm.loop !221

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !223
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !223
  store i8 0, i8* %arrayidx3, align 1, !dbg !224
  %8 = load i8*, i8** %data, align 8, !dbg !225
  call void @printLine(i8* %8), !dbg !226
  ret void, !dbg !227
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B2Source(i8* %data) #0 !dbg !228 {
entry:
  %data.addr = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !229, metadata !DIExpression()), !dbg !230
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !231
  %tobool = icmp ne i32 %0, 0, !dbg !231
  br i1 %tobool, label %if.then, label %if.end2, !dbg !233

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !234, metadata !DIExpression()), !dbg !237
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !238
  store i8* %call, i8** %dataBuffer, align 8, !dbg !237
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !239
  %cmp = icmp eq i8* %1, null, !dbg !241
  br i1 %cmp, label %if.then1, label %if.end, !dbg !242

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !243
  unreachable, !dbg !243

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !245
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !246
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !247
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !247
  store i8 0, i8* %arrayidx, align 1, !dbg !248
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !249
  store i8* %4, i8** %data.addr, align 8, !dbg !250
  br label %if.end2, !dbg !251

if.end2:                                          ; preds = %if.end, %entry
  %5 = load i8*, i8** %data.addr, align 8, !dbg !252
  ret i8* %5, !dbg !253
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !13, line: 24, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !9}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!0, !11, !15}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !13, line: 71, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_21.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !13, line: 72, type: !14, isLocal: true, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_loop_21_bad", scope: !13, file: !13, line: 42, type: !24, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !13, line: 44, type: !7)
!27 = !DILocation(line: 44, column: 12, scope: !23)
!28 = !DILocation(line: 45, column: 10, scope: !23)
!29 = !DILocation(line: 46, column: 15, scope: !23)
!30 = !DILocation(line: 47, column: 22, scope: !23)
!31 = !DILocation(line: 47, column: 12, scope: !23)
!32 = !DILocation(line: 47, column: 10, scope: !23)
!33 = !DILocalVariable(name: "i", scope: !34, file: !13, line: 49, type: !35)
!34 = distinct !DILexicalBlock(scope: !23, file: !13, line: 48, column: 5)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 46, baseType: !37)
!36 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!37 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 49, column: 16, scope: !34)
!39 = !DILocalVariable(name: "source", scope: !34, file: !13, line: 50, type: !40)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 800, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 50, column: 14, scope: !34)
!44 = !DILocation(line: 51, column: 9, scope: !34)
!45 = !DILocation(line: 52, column: 9, scope: !34)
!46 = !DILocation(line: 52, column: 23, scope: !34)
!47 = !DILocation(line: 54, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !34, file: !13, line: 54, column: 9)
!49 = !DILocation(line: 54, column: 14, scope: !48)
!50 = !DILocation(line: 54, column: 21, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !13, line: 54, column: 9)
!52 = !DILocation(line: 54, column: 23, scope: !51)
!53 = !DILocation(line: 54, column: 9, scope: !48)
!54 = !DILocation(line: 56, column: 30, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !13, line: 55, column: 9)
!56 = !DILocation(line: 56, column: 23, scope: !55)
!57 = !DILocation(line: 56, column: 13, scope: !55)
!58 = !DILocation(line: 56, column: 18, scope: !55)
!59 = !DILocation(line: 56, column: 21, scope: !55)
!60 = !DILocation(line: 57, column: 9, scope: !55)
!61 = !DILocation(line: 54, column: 31, scope: !51)
!62 = !DILocation(line: 54, column: 9, scope: !51)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 57, column: 9, scope: !48)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 59, column: 9, scope: !34)
!67 = !DILocation(line: 59, column: 21, scope: !34)
!68 = !DILocation(line: 60, column: 19, scope: !34)
!69 = !DILocation(line: 60, column: 9, scope: !34)
!70 = !DILocation(line: 64, column: 1, scope: !23)
!71 = distinct !DISubprogram(name: "badSource", scope: !13, file: !13, line: 26, type: !72, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DISubroutineType(types: !73)
!73 = !{!7, !7}
!74 = !DILocalVariable(name: "data", arg: 1, scope: !71, file: !13, line: 26, type: !7)
!75 = !DILocation(line: 26, column: 32, scope: !71)
!76 = !DILocation(line: 28, column: 8, scope: !77)
!77 = distinct !DILexicalBlock(scope: !71, file: !13, line: 28, column: 8)
!78 = !DILocation(line: 28, column: 8, scope: !71)
!79 = !DILocalVariable(name: "dataBuffer", scope: !80, file: !13, line: 31, type: !7)
!80 = distinct !DILexicalBlock(scope: !81, file: !13, line: 30, column: 9)
!81 = distinct !DILexicalBlock(scope: !77, file: !13, line: 29, column: 5)
!82 = !DILocation(line: 31, column: 20, scope: !80)
!83 = !DILocation(line: 31, column: 41, scope: !80)
!84 = !DILocation(line: 32, column: 17, scope: !85)
!85 = distinct !DILexicalBlock(scope: !80, file: !13, line: 32, column: 17)
!86 = !DILocation(line: 32, column: 28, scope: !85)
!87 = !DILocation(line: 32, column: 17, scope: !80)
!88 = !DILocation(line: 32, column: 38, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !13, line: 32, column: 37)
!90 = !DILocation(line: 33, column: 20, scope: !80)
!91 = !DILocation(line: 33, column: 13, scope: !80)
!92 = !DILocation(line: 34, column: 13, scope: !80)
!93 = !DILocation(line: 34, column: 31, scope: !80)
!94 = !DILocation(line: 36, column: 20, scope: !80)
!95 = !DILocation(line: 36, column: 31, scope: !80)
!96 = !DILocation(line: 36, column: 18, scope: !80)
!97 = !DILocation(line: 38, column: 5, scope: !81)
!98 = !DILocation(line: 39, column: 12, scope: !71)
!99 = !DILocation(line: 39, column: 5, scope: !71)
!100 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_loop_21_good", scope: !13, file: !13, line: 161, type: !24, scopeLine: 162, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!101 = !DILocation(line: 163, column: 5, scope: !100)
!102 = !DILocation(line: 164, column: 5, scope: !100)
!103 = !DILocation(line: 165, column: 1, scope: !100)
!104 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 177, type: !105, scopeLine: 178, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!105 = !DISubroutineType(types: !106)
!106 = !{!14, !14, !107}
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!108 = !DILocalVariable(name: "argc", arg: 1, scope: !104, file: !13, line: 177, type: !14)
!109 = !DILocation(line: 177, column: 14, scope: !104)
!110 = !DILocalVariable(name: "argv", arg: 2, scope: !104, file: !13, line: 177, type: !107)
!111 = !DILocation(line: 177, column: 27, scope: !104)
!112 = !DILocation(line: 180, column: 22, scope: !104)
!113 = !DILocation(line: 180, column: 12, scope: !104)
!114 = !DILocation(line: 180, column: 5, scope: !104)
!115 = !DILocation(line: 182, column: 5, scope: !104)
!116 = !DILocation(line: 183, column: 5, scope: !104)
!117 = !DILocation(line: 184, column: 5, scope: !104)
!118 = !DILocation(line: 187, column: 5, scope: !104)
!119 = !DILocation(line: 188, column: 5, scope: !104)
!120 = !DILocation(line: 189, column: 5, scope: !104)
!121 = !DILocation(line: 191, column: 5, scope: !104)
!122 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 96, type: !24, scopeLine: 97, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!123 = !DILocalVariable(name: "data", scope: !122, file: !13, line: 98, type: !7)
!124 = !DILocation(line: 98, column: 12, scope: !122)
!125 = !DILocation(line: 99, column: 10, scope: !122)
!126 = !DILocation(line: 100, column: 20, scope: !122)
!127 = !DILocation(line: 101, column: 27, scope: !122)
!128 = !DILocation(line: 101, column: 12, scope: !122)
!129 = !DILocation(line: 101, column: 10, scope: !122)
!130 = !DILocalVariable(name: "i", scope: !131, file: !13, line: 103, type: !35)
!131 = distinct !DILexicalBlock(scope: !122, file: !13, line: 102, column: 5)
!132 = !DILocation(line: 103, column: 16, scope: !131)
!133 = !DILocalVariable(name: "source", scope: !131, file: !13, line: 104, type: !40)
!134 = !DILocation(line: 104, column: 14, scope: !131)
!135 = !DILocation(line: 105, column: 9, scope: !131)
!136 = !DILocation(line: 106, column: 9, scope: !131)
!137 = !DILocation(line: 106, column: 23, scope: !131)
!138 = !DILocation(line: 108, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !131, file: !13, line: 108, column: 9)
!140 = !DILocation(line: 108, column: 14, scope: !139)
!141 = !DILocation(line: 108, column: 21, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !13, line: 108, column: 9)
!143 = !DILocation(line: 108, column: 23, scope: !142)
!144 = !DILocation(line: 108, column: 9, scope: !139)
!145 = !DILocation(line: 110, column: 30, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !13, line: 109, column: 9)
!147 = !DILocation(line: 110, column: 23, scope: !146)
!148 = !DILocation(line: 110, column: 13, scope: !146)
!149 = !DILocation(line: 110, column: 18, scope: !146)
!150 = !DILocation(line: 110, column: 21, scope: !146)
!151 = !DILocation(line: 111, column: 9, scope: !146)
!152 = !DILocation(line: 108, column: 31, scope: !142)
!153 = !DILocation(line: 108, column: 9, scope: !142)
!154 = distinct !{!154, !144, !155, !65}
!155 = !DILocation(line: 111, column: 9, scope: !139)
!156 = !DILocation(line: 113, column: 9, scope: !131)
!157 = !DILocation(line: 113, column: 21, scope: !131)
!158 = !DILocation(line: 114, column: 19, scope: !131)
!159 = !DILocation(line: 114, column: 9, scope: !131)
!160 = !DILocation(line: 118, column: 1, scope: !122)
!161 = distinct !DISubprogram(name: "goodG2B1Source", scope: !13, file: !13, line: 75, type: !72, scopeLine: 76, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!162 = !DILocalVariable(name: "data", arg: 1, scope: !161, file: !13, line: 75, type: !7)
!163 = !DILocation(line: 75, column: 37, scope: !161)
!164 = !DILocation(line: 77, column: 8, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !13, line: 77, column: 8)
!166 = !DILocation(line: 77, column: 8, scope: !161)
!167 = !DILocation(line: 80, column: 9, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !13, line: 78, column: 5)
!169 = !DILocation(line: 81, column: 5, scope: !168)
!170 = !DILocalVariable(name: "dataBuffer", scope: !171, file: !13, line: 85, type: !7)
!171 = distinct !DILexicalBlock(scope: !172, file: !13, line: 84, column: 9)
!172 = distinct !DILexicalBlock(scope: !165, file: !13, line: 83, column: 5)
!173 = !DILocation(line: 85, column: 20, scope: !171)
!174 = !DILocation(line: 85, column: 41, scope: !171)
!175 = !DILocation(line: 86, column: 17, scope: !176)
!176 = distinct !DILexicalBlock(scope: !171, file: !13, line: 86, column: 17)
!177 = !DILocation(line: 86, column: 28, scope: !176)
!178 = !DILocation(line: 86, column: 17, scope: !171)
!179 = !DILocation(line: 86, column: 38, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !13, line: 86, column: 37)
!181 = !DILocation(line: 87, column: 20, scope: !171)
!182 = !DILocation(line: 87, column: 13, scope: !171)
!183 = !DILocation(line: 88, column: 13, scope: !171)
!184 = !DILocation(line: 88, column: 31, scope: !171)
!185 = !DILocation(line: 90, column: 20, scope: !171)
!186 = !DILocation(line: 90, column: 18, scope: !171)
!187 = !DILocation(line: 93, column: 12, scope: !161)
!188 = !DILocation(line: 93, column: 5, scope: !161)
!189 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 137, type: !24, scopeLine: 138, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!190 = !DILocalVariable(name: "data", scope: !189, file: !13, line: 139, type: !7)
!191 = !DILocation(line: 139, column: 12, scope: !189)
!192 = !DILocation(line: 140, column: 10, scope: !189)
!193 = !DILocation(line: 141, column: 20, scope: !189)
!194 = !DILocation(line: 142, column: 27, scope: !189)
!195 = !DILocation(line: 142, column: 12, scope: !189)
!196 = !DILocation(line: 142, column: 10, scope: !189)
!197 = !DILocalVariable(name: "i", scope: !198, file: !13, line: 144, type: !35)
!198 = distinct !DILexicalBlock(scope: !189, file: !13, line: 143, column: 5)
!199 = !DILocation(line: 144, column: 16, scope: !198)
!200 = !DILocalVariable(name: "source", scope: !198, file: !13, line: 145, type: !40)
!201 = !DILocation(line: 145, column: 14, scope: !198)
!202 = !DILocation(line: 146, column: 9, scope: !198)
!203 = !DILocation(line: 147, column: 9, scope: !198)
!204 = !DILocation(line: 147, column: 23, scope: !198)
!205 = !DILocation(line: 149, column: 16, scope: !206)
!206 = distinct !DILexicalBlock(scope: !198, file: !13, line: 149, column: 9)
!207 = !DILocation(line: 149, column: 14, scope: !206)
!208 = !DILocation(line: 149, column: 21, scope: !209)
!209 = distinct !DILexicalBlock(scope: !206, file: !13, line: 149, column: 9)
!210 = !DILocation(line: 149, column: 23, scope: !209)
!211 = !DILocation(line: 149, column: 9, scope: !206)
!212 = !DILocation(line: 151, column: 30, scope: !213)
!213 = distinct !DILexicalBlock(scope: !209, file: !13, line: 150, column: 9)
!214 = !DILocation(line: 151, column: 23, scope: !213)
!215 = !DILocation(line: 151, column: 13, scope: !213)
!216 = !DILocation(line: 151, column: 18, scope: !213)
!217 = !DILocation(line: 151, column: 21, scope: !213)
!218 = !DILocation(line: 152, column: 9, scope: !213)
!219 = !DILocation(line: 149, column: 31, scope: !209)
!220 = !DILocation(line: 149, column: 9, scope: !209)
!221 = distinct !{!221, !211, !222, !65}
!222 = !DILocation(line: 152, column: 9, scope: !206)
!223 = !DILocation(line: 154, column: 9, scope: !198)
!224 = !DILocation(line: 154, column: 21, scope: !198)
!225 = !DILocation(line: 155, column: 19, scope: !198)
!226 = !DILocation(line: 155, column: 9, scope: !198)
!227 = !DILocation(line: 159, column: 1, scope: !189)
!228 = distinct !DISubprogram(name: "goodG2B2Source", scope: !13, file: !13, line: 121, type: !72, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!229 = !DILocalVariable(name: "data", arg: 1, scope: !228, file: !13, line: 121, type: !7)
!230 = !DILocation(line: 121, column: 37, scope: !228)
!231 = !DILocation(line: 123, column: 8, scope: !232)
!232 = distinct !DILexicalBlock(scope: !228, file: !13, line: 123, column: 8)
!233 = !DILocation(line: 123, column: 8, scope: !228)
!234 = !DILocalVariable(name: "dataBuffer", scope: !235, file: !13, line: 126, type: !7)
!235 = distinct !DILexicalBlock(scope: !236, file: !13, line: 125, column: 9)
!236 = distinct !DILexicalBlock(scope: !232, file: !13, line: 124, column: 5)
!237 = !DILocation(line: 126, column: 20, scope: !235)
!238 = !DILocation(line: 126, column: 41, scope: !235)
!239 = !DILocation(line: 127, column: 17, scope: !240)
!240 = distinct !DILexicalBlock(scope: !235, file: !13, line: 127, column: 17)
!241 = !DILocation(line: 127, column: 28, scope: !240)
!242 = !DILocation(line: 127, column: 17, scope: !235)
!243 = !DILocation(line: 127, column: 38, scope: !244)
!244 = distinct !DILexicalBlock(scope: !240, file: !13, line: 127, column: 37)
!245 = !DILocation(line: 128, column: 20, scope: !235)
!246 = !DILocation(line: 128, column: 13, scope: !235)
!247 = !DILocation(line: 129, column: 13, scope: !235)
!248 = !DILocation(line: 129, column: 31, scope: !235)
!249 = !DILocation(line: 131, column: 20, scope: !235)
!250 = !DILocation(line: 131, column: 18, scope: !235)
!251 = !DILocation(line: 133, column: 5, scope: !236)
!252 = !DILocation(line: 134, column: 12, scope: !228)
!253 = !DILocation(line: 134, column: 5, scope: !228)
