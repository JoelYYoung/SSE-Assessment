; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_21.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_21_bad() #0 !dbg !23 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !26, metadata !DIExpression()), !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !28
  store i8* %call, i8** %data, align 8, !dbg !29
  %0 = load i8*, i8** %data, align 8, !dbg !30
  %cmp = icmp eq i8* %0, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  store i32 1, i32* @badStatic, align 4, !dbg !36
  %1 = load i8*, i8** %data, align 8, !dbg !37
  %call1 = call i8* @badSource(i8* %1), !dbg !38
  store i8* %call1, i8** %data, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !51, metadata !DIExpression()), !dbg !52
  %3 = load i8*, i8** %data, align 8, !dbg !53
  %call2 = call i64 @strlen(i8* %3) #9, !dbg !54
  store i64 %call2, i64* %dataLen, align 8, !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !59
  %5 = load i64, i64* %dataLen, align 8, !dbg !61
  %cmp3 = icmp ult i64 %4, %5, !dbg !62
  br i1 %cmp3, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !64
  %7 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !64
  %8 = load i8, i8* %arrayidx, align 1, !dbg !64
  %9 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %9, !dbg !68
  store i8 %8, i8* %arrayidx4, align 1, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %10, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !76
  store i8 0, i8* %arrayidx5, align 1, !dbg !77
  %11 = load i8*, i8** %data, align 8, !dbg !78
  call void @printLine(i8* %11), !dbg !79
  %12 = load i8*, i8** %data, align 8, !dbg !80
  call void @free(i8* %12) #7, !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !83 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %0 = load i32, i32* @badStatic, align 4, !dbg !88
  %tobool = icmp ne i32 %0, 0, !dbg !88
  br i1 %tobool, label %if.then, label %if.end, !dbg !90

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !93
  %2 = load i8*, i8** %data.addr, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !94
  store i8 0, i8* %arrayidx, align 1, !dbg !95
  br label %if.end, !dbg !96

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !97
  ret i8* %3, !dbg !98
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_21_good() #0 !dbg !99 {
entry:
  call void @goodG2B1(), !dbg !100
  call void @goodG2B2(), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !103 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !107, metadata !DIExpression()), !dbg !108
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !109, metadata !DIExpression()), !dbg !110
  %call = call i64 @time(i64* null) #7, !dbg !111
  %conv = trunc i64 %call to i32, !dbg !112
  call void @srand(i32 %conv) #7, !dbg !113
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !114
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_21_good(), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !116
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !117
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_21_bad(), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !119
  ret i32 0, !dbg !120
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !121 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !122, metadata !DIExpression()), !dbg !123
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !124
  store i8* %call, i8** %data, align 8, !dbg !125
  %0 = load i8*, i8** %data, align 8, !dbg !126
  %cmp = icmp eq i8* %0, null, !dbg !128
  br i1 %cmp, label %if.then, label %if.end, !dbg !129

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !130
  unreachable, !dbg !130

if.end:                                           ; preds = %entry
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !132
  %1 = load i8*, i8** %data, align 8, !dbg !133
  %call1 = call i8* @goodG2B1Source(i8* %1), !dbg !134
  store i8* %call1, i8** %data, align 8, !dbg !135
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !136, metadata !DIExpression()), !dbg !138
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !138
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !138
  call void @llvm.dbg.declare(metadata i64* %i, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !141, metadata !DIExpression()), !dbg !142
  %3 = load i8*, i8** %data, align 8, !dbg !143
  %call2 = call i64 @strlen(i8* %3) #9, !dbg !144
  store i64 %call2, i64* %dataLen, align 8, !dbg !145
  store i64 0, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !148

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !149
  %5 = load i64, i64* %dataLen, align 8, !dbg !151
  %cmp3 = icmp ult i64 %4, %5, !dbg !152
  br i1 %cmp3, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !154
  %7 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !154
  %8 = load i8, i8* %arrayidx, align 1, !dbg !154
  %9 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %9, !dbg !158
  store i8 %8, i8* %arrayidx4, align 1, !dbg !159
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !161
  %inc = add i64 %10, 1, !dbg !161
  store i64 %inc, i64* %i, align 8, !dbg !161
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !165
  store i8 0, i8* %arrayidx5, align 1, !dbg !166
  %11 = load i8*, i8** %data, align 8, !dbg !167
  call void @printLine(i8* %11), !dbg !168
  %12 = load i8*, i8** %data, align 8, !dbg !169
  call void @free(i8* %12) #7, !dbg !170
  ret void, !dbg !171
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B1Source(i8* %data) #0 !dbg !172 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !173, metadata !DIExpression()), !dbg !174
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !175
  %tobool = icmp ne i32 %0, 0, !dbg !175
  br i1 %tobool, label %if.then, label %if.else, !dbg !177

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !178
  br label %if.end, !dbg !180

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !181
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !183
  %2 = load i8*, i8** %data.addr, align 8, !dbg !184
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !184
  store i8 0, i8* %arrayidx, align 1, !dbg !185
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i8*, i8** %data.addr, align 8, !dbg !186
  ret i8* %3, !dbg !187
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !188 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !189, metadata !DIExpression()), !dbg !190
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !191
  store i8* %call, i8** %data, align 8, !dbg !192
  %0 = load i8*, i8** %data, align 8, !dbg !193
  %cmp = icmp eq i8* %0, null, !dbg !195
  br i1 %cmp, label %if.then, label %if.end, !dbg !196

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !197
  unreachable, !dbg !197

if.end:                                           ; preds = %entry
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !199
  %1 = load i8*, i8** %data, align 8, !dbg !200
  %call1 = call i8* @goodG2B2Source(i8* %1), !dbg !201
  store i8* %call1, i8** %data, align 8, !dbg !202
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !203, metadata !DIExpression()), !dbg !205
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !205
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !205
  call void @llvm.dbg.declare(metadata i64* %i, metadata !206, metadata !DIExpression()), !dbg !207
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !208, metadata !DIExpression()), !dbg !209
  %3 = load i8*, i8** %data, align 8, !dbg !210
  %call2 = call i64 @strlen(i8* %3) #9, !dbg !211
  store i64 %call2, i64* %dataLen, align 8, !dbg !212
  store i64 0, i64* %i, align 8, !dbg !213
  br label %for.cond, !dbg !215

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !216
  %5 = load i64, i64* %dataLen, align 8, !dbg !218
  %cmp3 = icmp ult i64 %4, %5, !dbg !219
  br i1 %cmp3, label %for.body, label %for.end, !dbg !220

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !221
  %7 = load i64, i64* %i, align 8, !dbg !223
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !221
  %8 = load i8, i8* %arrayidx, align 1, !dbg !221
  %9 = load i64, i64* %i, align 8, !dbg !224
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %9, !dbg !225
  store i8 %8, i8* %arrayidx4, align 1, !dbg !226
  br label %for.inc, !dbg !227

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !228
  %inc = add i64 %10, 1, !dbg !228
  store i64 %inc, i64* %i, align 8, !dbg !228
  br label %for.cond, !dbg !229, !llvm.loop !230

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !232
  store i8 0, i8* %arrayidx5, align 1, !dbg !233
  %11 = load i8*, i8** %data, align 8, !dbg !234
  call void @printLine(i8* %11), !dbg !235
  %12 = load i8*, i8** %data, align 8, !dbg !236
  call void @free(i8* %12) #7, !dbg !237
  ret void, !dbg !238
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B2Source(i8* %data) #0 !dbg !239 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !240, metadata !DIExpression()), !dbg !241
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !242
  %tobool = icmp ne i32 %0, 0, !dbg !242
  br i1 %tobool, label %if.then, label %if.end, !dbg !244

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !245
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !247
  %2 = load i8*, i8** %data.addr, align 8, !dbg !248
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !248
  store i8 0, i8* %arrayidx, align 1, !dbg !249
  br label %if.end, !dbg !250

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !251
  ret i8* %3, !dbg !252
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !13, line: 24, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_21.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11, !15}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !13, line: 64, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_21.c", directory: "/root/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !13, line: 65, type: !14, isLocal: true, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_21_bad", scope: !13, file: !13, line: 37, type: !24, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !13, line: 39, type: !6)
!27 = !DILocation(line: 39, column: 12, scope: !23)
!28 = !DILocation(line: 40, column: 20, scope: !23)
!29 = !DILocation(line: 40, column: 10, scope: !23)
!30 = !DILocation(line: 41, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !23, file: !13, line: 41, column: 9)
!32 = !DILocation(line: 41, column: 14, scope: !31)
!33 = !DILocation(line: 41, column: 9, scope: !23)
!34 = !DILocation(line: 41, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !13, line: 41, column: 23)
!36 = !DILocation(line: 42, column: 15, scope: !23)
!37 = !DILocation(line: 43, column: 22, scope: !23)
!38 = !DILocation(line: 43, column: 12, scope: !23)
!39 = !DILocation(line: 43, column: 10, scope: !23)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !13, line: 45, type: !42)
!41 = distinct !DILexicalBlock(scope: !23, file: !13, line: 44, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 50)
!45 = !DILocation(line: 45, column: 14, scope: !41)
!46 = !DILocalVariable(name: "i", scope: !41, file: !13, line: 46, type: !47)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 46, baseType: !49)
!48 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 46, column: 16, scope: !41)
!51 = !DILocalVariable(name: "dataLen", scope: !41, file: !13, line: 46, type: !47)
!52 = !DILocation(line: 46, column: 19, scope: !41)
!53 = !DILocation(line: 47, column: 26, scope: !41)
!54 = !DILocation(line: 47, column: 19, scope: !41)
!55 = !DILocation(line: 47, column: 17, scope: !41)
!56 = !DILocation(line: 49, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !41, file: !13, line: 49, column: 9)
!58 = !DILocation(line: 49, column: 14, scope: !57)
!59 = !DILocation(line: 49, column: 21, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !13, line: 49, column: 9)
!61 = !DILocation(line: 49, column: 25, scope: !60)
!62 = !DILocation(line: 49, column: 23, scope: !60)
!63 = !DILocation(line: 49, column: 9, scope: !57)
!64 = !DILocation(line: 51, column: 23, scope: !65)
!65 = distinct !DILexicalBlock(scope: !60, file: !13, line: 50, column: 9)
!66 = !DILocation(line: 51, column: 28, scope: !65)
!67 = !DILocation(line: 51, column: 18, scope: !65)
!68 = !DILocation(line: 51, column: 13, scope: !65)
!69 = !DILocation(line: 51, column: 21, scope: !65)
!70 = !DILocation(line: 52, column: 9, scope: !65)
!71 = !DILocation(line: 49, column: 35, scope: !60)
!72 = !DILocation(line: 49, column: 9, scope: !60)
!73 = distinct !{!73, !63, !74, !75}
!74 = !DILocation(line: 52, column: 9, scope: !57)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 53, column: 9, scope: !41)
!77 = !DILocation(line: 53, column: 20, scope: !41)
!78 = !DILocation(line: 54, column: 19, scope: !41)
!79 = !DILocation(line: 54, column: 9, scope: !41)
!80 = !DILocation(line: 55, column: 14, scope: !41)
!81 = !DILocation(line: 55, column: 9, scope: !41)
!82 = !DILocation(line: 57, column: 1, scope: !23)
!83 = distinct !DISubprogram(name: "badSource", scope: !13, file: !13, line: 26, type: !84, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DISubroutineType(types: !85)
!85 = !{!6, !6}
!86 = !DILocalVariable(name: "data", arg: 1, scope: !83, file: !13, line: 26, type: !6)
!87 = !DILocation(line: 26, column: 32, scope: !83)
!88 = !DILocation(line: 28, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !83, file: !13, line: 28, column: 8)
!90 = !DILocation(line: 28, column: 8, scope: !83)
!91 = !DILocation(line: 31, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !13, line: 29, column: 5)
!93 = !DILocation(line: 31, column: 9, scope: !92)
!94 = !DILocation(line: 32, column: 9, scope: !92)
!95 = !DILocation(line: 32, column: 21, scope: !92)
!96 = !DILocation(line: 33, column: 5, scope: !92)
!97 = !DILocation(line: 34, column: 12, scope: !83)
!98 = !DILocation(line: 34, column: 5, scope: !83)
!99 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_21_good", scope: !13, file: !13, line: 140, type: !24, scopeLine: 141, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!100 = !DILocation(line: 142, column: 5, scope: !99)
!101 = !DILocation(line: 143, column: 5, scope: !99)
!102 = !DILocation(line: 144, column: 1, scope: !99)
!103 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 156, type: !104, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!104 = !DISubroutineType(types: !105)
!105 = !{!14, !14, !106}
!106 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!107 = !DILocalVariable(name: "argc", arg: 1, scope: !103, file: !13, line: 156, type: !14)
!108 = !DILocation(line: 156, column: 14, scope: !103)
!109 = !DILocalVariable(name: "argv", arg: 2, scope: !103, file: !13, line: 156, type: !106)
!110 = !DILocation(line: 156, column: 27, scope: !103)
!111 = !DILocation(line: 159, column: 22, scope: !103)
!112 = !DILocation(line: 159, column: 12, scope: !103)
!113 = !DILocation(line: 159, column: 5, scope: !103)
!114 = !DILocation(line: 161, column: 5, scope: !103)
!115 = !DILocation(line: 162, column: 5, scope: !103)
!116 = !DILocation(line: 163, column: 5, scope: !103)
!117 = !DILocation(line: 166, column: 5, scope: !103)
!118 = !DILocation(line: 167, column: 5, scope: !103)
!119 = !DILocation(line: 168, column: 5, scope: !103)
!120 = !DILocation(line: 170, column: 5, scope: !103)
!121 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 84, type: !24, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!122 = !DILocalVariable(name: "data", scope: !121, file: !13, line: 86, type: !6)
!123 = !DILocation(line: 86, column: 12, scope: !121)
!124 = !DILocation(line: 87, column: 20, scope: !121)
!125 = !DILocation(line: 87, column: 10, scope: !121)
!126 = !DILocation(line: 88, column: 9, scope: !127)
!127 = distinct !DILexicalBlock(scope: !121, file: !13, line: 88, column: 9)
!128 = !DILocation(line: 88, column: 14, scope: !127)
!129 = !DILocation(line: 88, column: 9, scope: !121)
!130 = !DILocation(line: 88, column: 24, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !13, line: 88, column: 23)
!132 = !DILocation(line: 89, column: 20, scope: !121)
!133 = !DILocation(line: 90, column: 27, scope: !121)
!134 = !DILocation(line: 90, column: 12, scope: !121)
!135 = !DILocation(line: 90, column: 10, scope: !121)
!136 = !DILocalVariable(name: "dest", scope: !137, file: !13, line: 92, type: !42)
!137 = distinct !DILexicalBlock(scope: !121, file: !13, line: 91, column: 5)
!138 = !DILocation(line: 92, column: 14, scope: !137)
!139 = !DILocalVariable(name: "i", scope: !137, file: !13, line: 93, type: !47)
!140 = !DILocation(line: 93, column: 16, scope: !137)
!141 = !DILocalVariable(name: "dataLen", scope: !137, file: !13, line: 93, type: !47)
!142 = !DILocation(line: 93, column: 19, scope: !137)
!143 = !DILocation(line: 94, column: 26, scope: !137)
!144 = !DILocation(line: 94, column: 19, scope: !137)
!145 = !DILocation(line: 94, column: 17, scope: !137)
!146 = !DILocation(line: 96, column: 16, scope: !147)
!147 = distinct !DILexicalBlock(scope: !137, file: !13, line: 96, column: 9)
!148 = !DILocation(line: 96, column: 14, scope: !147)
!149 = !DILocation(line: 96, column: 21, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !13, line: 96, column: 9)
!151 = !DILocation(line: 96, column: 25, scope: !150)
!152 = !DILocation(line: 96, column: 23, scope: !150)
!153 = !DILocation(line: 96, column: 9, scope: !147)
!154 = !DILocation(line: 98, column: 23, scope: !155)
!155 = distinct !DILexicalBlock(scope: !150, file: !13, line: 97, column: 9)
!156 = !DILocation(line: 98, column: 28, scope: !155)
!157 = !DILocation(line: 98, column: 18, scope: !155)
!158 = !DILocation(line: 98, column: 13, scope: !155)
!159 = !DILocation(line: 98, column: 21, scope: !155)
!160 = !DILocation(line: 99, column: 9, scope: !155)
!161 = !DILocation(line: 96, column: 35, scope: !150)
!162 = !DILocation(line: 96, column: 9, scope: !150)
!163 = distinct !{!163, !153, !164, !75}
!164 = !DILocation(line: 99, column: 9, scope: !147)
!165 = !DILocation(line: 100, column: 9, scope: !137)
!166 = !DILocation(line: 100, column: 20, scope: !137)
!167 = !DILocation(line: 101, column: 19, scope: !137)
!168 = !DILocation(line: 101, column: 9, scope: !137)
!169 = !DILocation(line: 102, column: 14, scope: !137)
!170 = !DILocation(line: 102, column: 9, scope: !137)
!171 = !DILocation(line: 104, column: 1, scope: !121)
!172 = distinct !DISubprogram(name: "goodG2B1Source", scope: !13, file: !13, line: 68, type: !84, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!173 = !DILocalVariable(name: "data", arg: 1, scope: !172, file: !13, line: 68, type: !6)
!174 = !DILocation(line: 68, column: 37, scope: !172)
!175 = !DILocation(line: 70, column: 8, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !13, line: 70, column: 8)
!177 = !DILocation(line: 70, column: 8, scope: !172)
!178 = !DILocation(line: 73, column: 9, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !13, line: 71, column: 5)
!180 = !DILocation(line: 74, column: 5, scope: !179)
!181 = !DILocation(line: 78, column: 16, scope: !182)
!182 = distinct !DILexicalBlock(scope: !176, file: !13, line: 76, column: 5)
!183 = !DILocation(line: 78, column: 9, scope: !182)
!184 = !DILocation(line: 79, column: 9, scope: !182)
!185 = !DILocation(line: 79, column: 20, scope: !182)
!186 = !DILocation(line: 81, column: 12, scope: !172)
!187 = !DILocation(line: 81, column: 5, scope: !172)
!188 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 118, type: !24, scopeLine: 119, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!189 = !DILocalVariable(name: "data", scope: !188, file: !13, line: 120, type: !6)
!190 = !DILocation(line: 120, column: 12, scope: !188)
!191 = !DILocation(line: 121, column: 20, scope: !188)
!192 = !DILocation(line: 121, column: 10, scope: !188)
!193 = !DILocation(line: 122, column: 9, scope: !194)
!194 = distinct !DILexicalBlock(scope: !188, file: !13, line: 122, column: 9)
!195 = !DILocation(line: 122, column: 14, scope: !194)
!196 = !DILocation(line: 122, column: 9, scope: !188)
!197 = !DILocation(line: 122, column: 24, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !13, line: 122, column: 23)
!199 = !DILocation(line: 123, column: 20, scope: !188)
!200 = !DILocation(line: 124, column: 27, scope: !188)
!201 = !DILocation(line: 124, column: 12, scope: !188)
!202 = !DILocation(line: 124, column: 10, scope: !188)
!203 = !DILocalVariable(name: "dest", scope: !204, file: !13, line: 126, type: !42)
!204 = distinct !DILexicalBlock(scope: !188, file: !13, line: 125, column: 5)
!205 = !DILocation(line: 126, column: 14, scope: !204)
!206 = !DILocalVariable(name: "i", scope: !204, file: !13, line: 127, type: !47)
!207 = !DILocation(line: 127, column: 16, scope: !204)
!208 = !DILocalVariable(name: "dataLen", scope: !204, file: !13, line: 127, type: !47)
!209 = !DILocation(line: 127, column: 19, scope: !204)
!210 = !DILocation(line: 128, column: 26, scope: !204)
!211 = !DILocation(line: 128, column: 19, scope: !204)
!212 = !DILocation(line: 128, column: 17, scope: !204)
!213 = !DILocation(line: 130, column: 16, scope: !214)
!214 = distinct !DILexicalBlock(scope: !204, file: !13, line: 130, column: 9)
!215 = !DILocation(line: 130, column: 14, scope: !214)
!216 = !DILocation(line: 130, column: 21, scope: !217)
!217 = distinct !DILexicalBlock(scope: !214, file: !13, line: 130, column: 9)
!218 = !DILocation(line: 130, column: 25, scope: !217)
!219 = !DILocation(line: 130, column: 23, scope: !217)
!220 = !DILocation(line: 130, column: 9, scope: !214)
!221 = !DILocation(line: 132, column: 23, scope: !222)
!222 = distinct !DILexicalBlock(scope: !217, file: !13, line: 131, column: 9)
!223 = !DILocation(line: 132, column: 28, scope: !222)
!224 = !DILocation(line: 132, column: 18, scope: !222)
!225 = !DILocation(line: 132, column: 13, scope: !222)
!226 = !DILocation(line: 132, column: 21, scope: !222)
!227 = !DILocation(line: 133, column: 9, scope: !222)
!228 = !DILocation(line: 130, column: 35, scope: !217)
!229 = !DILocation(line: 130, column: 9, scope: !217)
!230 = distinct !{!230, !220, !231, !75}
!231 = !DILocation(line: 133, column: 9, scope: !214)
!232 = !DILocation(line: 134, column: 9, scope: !204)
!233 = !DILocation(line: 134, column: 20, scope: !204)
!234 = !DILocation(line: 135, column: 19, scope: !204)
!235 = !DILocation(line: 135, column: 9, scope: !204)
!236 = !DILocation(line: 136, column: 14, scope: !204)
!237 = !DILocation(line: 136, column: 9, scope: !204)
!238 = !DILocation(line: 138, column: 1, scope: !188)
!239 = distinct !DISubprogram(name: "goodG2B2Source", scope: !13, file: !13, line: 107, type: !84, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!240 = !DILocalVariable(name: "data", arg: 1, scope: !239, file: !13, line: 107, type: !6)
!241 = !DILocation(line: 107, column: 37, scope: !239)
!242 = !DILocation(line: 109, column: 8, scope: !243)
!243 = distinct !DILexicalBlock(scope: !239, file: !13, line: 109, column: 8)
!244 = !DILocation(line: 109, column: 8, scope: !239)
!245 = !DILocation(line: 112, column: 16, scope: !246)
!246 = distinct !DILexicalBlock(scope: !243, file: !13, line: 110, column: 5)
!247 = !DILocation(line: 112, column: 9, scope: !246)
!248 = !DILocation(line: 113, column: 9, scope: !246)
!249 = !DILocation(line: 113, column: 20, scope: !246)
!250 = !DILocation(line: 114, column: 5, scope: !246)
!251 = !DILocation(line: 115, column: 12, scope: !239)
!252 = !DILocation(line: 115, column: 5, scope: !239)
