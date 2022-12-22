; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_08.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_08_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 50, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 100, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !26
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !30
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !31
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !31
  store i8 0, i8* %arrayidx1, align 1, !dbg !32
  %call = call i32 @staticReturnsTrue(), !dbg !33
  %tobool = icmp ne i32 %call, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %6 = load i8*, i8** %dataBadBuffer, align 8, !dbg !36
  store i8* %6, i8** %data, align 8, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !48, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !53
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !54
  store i8 0, i8* %arrayidx2, align 1, !dbg !55
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !56
  %call4 = call i64 @strlen(i8* %arraydecay3) #6, !dbg !57
  store i64 %call4, i64* %destLen, align 8, !dbg !58
  store i64 0, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !62
  %8 = load i64, i64* %destLen, align 8, !dbg !64
  %cmp = icmp ult i64 %7, %8, !dbg !65
  br i1 %cmp, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !67
  %10 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx5 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !67
  %11 = load i8, i8* %arrayidx5, align 1, !dbg !67
  %12 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %12, !dbg !71
  store i8 %11, i8* %arrayidx6, align 1, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !74
  %inc = add i64 %13, 1, !dbg !74
  store i64 %inc, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !79
  store i8 0, i8* %arrayidx7, align 1, !dbg !80
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !81
  call void @printLine(i8* %arraydecay8), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_08_good() #0 !dbg !84 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !93, metadata !DIExpression()), !dbg !94
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call i64 @time(i64* null) #7, !dbg !97
  %conv = trunc i64 %call to i32, !dbg !98
  call void @srand(i32 %conv) #7, !dbg !99
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !100
  call void @CWE126_Buffer_Overread__char_alloca_loop_08_good(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @CWE126_Buffer_Overread__char_alloca_loop_08_bad(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !107 {
entry:
  ret i32 1, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !111 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %0 = alloca i8, i64 50, align 16, !dbg !116
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %1 = alloca i8, i64 100, align 16, !dbg !119
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !118
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !121
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !122
  store i8 0, i8* %arrayidx, align 1, !dbg !123
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !125
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !126
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !126
  store i8 0, i8* %arrayidx1, align 1, !dbg !127
  %call = call i32 @staticReturnsFalse(), !dbg !128
  %tobool = icmp ne i32 %call, 0, !dbg !128
  br i1 %tobool, label %if.then, label %if.else, !dbg !130

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !131
  br label %if.end, !dbg !133

if.else:                                          ; preds = %entry
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !134
  store i8* %6, i8** %data, align 8, !dbg !136
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !137, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !142, metadata !DIExpression()), !dbg !143
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !144
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !144
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !145
  store i8 0, i8* %arrayidx2, align 1, !dbg !146
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !147
  %call4 = call i64 @strlen(i8* %arraydecay3) #6, !dbg !148
  store i64 %call4, i64* %destLen, align 8, !dbg !149
  store i64 0, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !152

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !153
  %8 = load i64, i64* %destLen, align 8, !dbg !155
  %cmp = icmp ult i64 %7, %8, !dbg !156
  br i1 %cmp, label %for.body, label %for.end, !dbg !157

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !158
  %10 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx5 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !158
  %11 = load i8, i8* %arrayidx5, align 1, !dbg !158
  %12 = load i64, i64* %i, align 8, !dbg !161
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %12, !dbg !162
  store i8 %11, i8* %arrayidx6, align 1, !dbg !163
  br label %for.inc, !dbg !164

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !165
  %inc = add i64 %13, 1, !dbg !165
  store i64 %inc, i64* %i, align 8, !dbg !165
  br label %for.cond, !dbg !166, !llvm.loop !167

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !169
  store i8 0, i8* %arrayidx7, align 1, !dbg !170
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !171
  call void @printLine(i8* %arraydecay8), !dbg !172
  ret void, !dbg !173
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !174 {
entry:
  ret i32 0, !dbg !175
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !176 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !177, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !179, metadata !DIExpression()), !dbg !180
  %0 = alloca i8, i64 50, align 16, !dbg !181
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !180
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !182, metadata !DIExpression()), !dbg !183
  %1 = alloca i8, i64 100, align 16, !dbg !184
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !183
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !185
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !186
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !187
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !187
  store i8 0, i8* %arrayidx, align 1, !dbg !188
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !189
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !190
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !191
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !191
  store i8 0, i8* %arrayidx1, align 1, !dbg !192
  %call = call i32 @staticReturnsTrue(), !dbg !193
  %tobool = icmp ne i32 %call, 0, !dbg !193
  br i1 %tobool, label %if.then, label %if.end, !dbg !195

if.then:                                          ; preds = %entry
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !196
  store i8* %6, i8** %data, align 8, !dbg !198
  br label %if.end, !dbg !199

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !200, metadata !DIExpression()), !dbg !202
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !203, metadata !DIExpression()), !dbg !204
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !205, metadata !DIExpression()), !dbg !206
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !207
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !207
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !208
  store i8 0, i8* %arrayidx2, align 1, !dbg !209
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !210
  %call4 = call i64 @strlen(i8* %arraydecay3) #6, !dbg !211
  store i64 %call4, i64* %destLen, align 8, !dbg !212
  store i64 0, i64* %i, align 8, !dbg !213
  br label %for.cond, !dbg !215

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !216
  %8 = load i64, i64* %destLen, align 8, !dbg !218
  %cmp = icmp ult i64 %7, %8, !dbg !219
  br i1 %cmp, label %for.body, label %for.end, !dbg !220

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !221
  %10 = load i64, i64* %i, align 8, !dbg !223
  %arrayidx5 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !221
  %11 = load i8, i8* %arrayidx5, align 1, !dbg !221
  %12 = load i64, i64* %i, align 8, !dbg !224
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %12, !dbg !225
  store i8 %11, i8* %arrayidx6, align 1, !dbg !226
  br label %for.inc, !dbg !227

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !228
  %inc = add i64 %13, 1, !dbg !228
  store i64 %inc, i64* %i, align 8, !dbg !228
  br label %for.cond, !dbg !229, !llvm.loop !230

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !232
  store i8 0, i8* %arrayidx7, align 1, !dbg !233
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !234
  call void @printLine(i8* %arraydecay8), !dbg !235
  ret void, !dbg !236
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_08_bad", scope: !14, file: !14, line: 37, type: !15, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_08.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 39, type: !4)
!18 = !DILocation(line: 39, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 40, type: !4)
!20 = !DILocation(line: 40, column: 12, scope: !13)
!21 = !DILocation(line: 40, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 41, type: !4)
!23 = !DILocation(line: 41, column: 12, scope: !13)
!24 = !DILocation(line: 41, column: 37, scope: !13)
!25 = !DILocation(line: 42, column: 12, scope: !13)
!26 = !DILocation(line: 42, column: 5, scope: !13)
!27 = !DILocation(line: 43, column: 5, scope: !13)
!28 = !DILocation(line: 43, column: 25, scope: !13)
!29 = !DILocation(line: 44, column: 12, scope: !13)
!30 = !DILocation(line: 44, column: 5, scope: !13)
!31 = !DILocation(line: 45, column: 5, scope: !13)
!32 = !DILocation(line: 45, column: 27, scope: !13)
!33 = !DILocation(line: 46, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !13, file: !14, line: 46, column: 8)
!35 = !DILocation(line: 46, column: 8, scope: !13)
!36 = !DILocation(line: 49, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !14, line: 47, column: 5)
!38 = !DILocation(line: 49, column: 14, scope: !37)
!39 = !DILocation(line: 50, column: 5, scope: !37)
!40 = !DILocalVariable(name: "i", scope: !41, file: !14, line: 52, type: !42)
!41 = distinct !DILexicalBlock(scope: !13, file: !14, line: 51, column: 5)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 52, column: 16, scope: !41)
!46 = !DILocalVariable(name: "destLen", scope: !41, file: !14, line: 52, type: !42)
!47 = !DILocation(line: 52, column: 19, scope: !41)
!48 = !DILocalVariable(name: "dest", scope: !41, file: !14, line: 53, type: !49)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 100)
!52 = !DILocation(line: 53, column: 14, scope: !41)
!53 = !DILocation(line: 54, column: 9, scope: !41)
!54 = !DILocation(line: 55, column: 9, scope: !41)
!55 = !DILocation(line: 55, column: 21, scope: !41)
!56 = !DILocation(line: 56, column: 26, scope: !41)
!57 = !DILocation(line: 56, column: 19, scope: !41)
!58 = !DILocation(line: 56, column: 17, scope: !41)
!59 = !DILocation(line: 59, column: 16, scope: !60)
!60 = distinct !DILexicalBlock(scope: !41, file: !14, line: 59, column: 9)
!61 = !DILocation(line: 59, column: 14, scope: !60)
!62 = !DILocation(line: 59, column: 21, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !14, line: 59, column: 9)
!64 = !DILocation(line: 59, column: 25, scope: !63)
!65 = !DILocation(line: 59, column: 23, scope: !63)
!66 = !DILocation(line: 59, column: 9, scope: !60)
!67 = !DILocation(line: 61, column: 23, scope: !68)
!68 = distinct !DILexicalBlock(scope: !63, file: !14, line: 60, column: 9)
!69 = !DILocation(line: 61, column: 28, scope: !68)
!70 = !DILocation(line: 61, column: 18, scope: !68)
!71 = !DILocation(line: 61, column: 13, scope: !68)
!72 = !DILocation(line: 61, column: 21, scope: !68)
!73 = !DILocation(line: 62, column: 9, scope: !68)
!74 = !DILocation(line: 59, column: 35, scope: !63)
!75 = !DILocation(line: 59, column: 9, scope: !63)
!76 = distinct !{!76, !66, !77, !78}
!77 = !DILocation(line: 62, column: 9, scope: !60)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocation(line: 63, column: 9, scope: !41)
!80 = !DILocation(line: 63, column: 21, scope: !41)
!81 = !DILocation(line: 64, column: 19, scope: !41)
!82 = !DILocation(line: 64, column: 9, scope: !41)
!83 = !DILocation(line: 66, column: 1, scope: !13)
!84 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_08_good", scope: !14, file: !14, line: 141, type: !15, scopeLine: 142, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocation(line: 143, column: 5, scope: !84)
!86 = !DILocation(line: 144, column: 5, scope: !84)
!87 = !DILocation(line: 145, column: 1, scope: !84)
!88 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 157, type: !89, scopeLine: 158, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!91, !91, !92}
!91 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !14, line: 157, type: !91)
!94 = !DILocation(line: 157, column: 14, scope: !88)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !14, line: 157, type: !92)
!96 = !DILocation(line: 157, column: 27, scope: !88)
!97 = !DILocation(line: 160, column: 22, scope: !88)
!98 = !DILocation(line: 160, column: 12, scope: !88)
!99 = !DILocation(line: 160, column: 5, scope: !88)
!100 = !DILocation(line: 162, column: 5, scope: !88)
!101 = !DILocation(line: 163, column: 5, scope: !88)
!102 = !DILocation(line: 164, column: 5, scope: !88)
!103 = !DILocation(line: 167, column: 5, scope: !88)
!104 = !DILocation(line: 168, column: 5, scope: !88)
!105 = !DILocation(line: 169, column: 5, scope: !88)
!106 = !DILocation(line: 171, column: 5, scope: !88)
!107 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !14, file: !14, line: 25, type: !108, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DISubroutineType(types: !109)
!109 = !{!91}
!110 = !DILocation(line: 27, column: 5, scope: !107)
!111 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 73, type: !15, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", scope: !111, file: !14, line: 75, type: !4)
!113 = !DILocation(line: 75, column: 12, scope: !111)
!114 = !DILocalVariable(name: "dataBadBuffer", scope: !111, file: !14, line: 76, type: !4)
!115 = !DILocation(line: 76, column: 12, scope: !111)
!116 = !DILocation(line: 76, column: 36, scope: !111)
!117 = !DILocalVariable(name: "dataGoodBuffer", scope: !111, file: !14, line: 77, type: !4)
!118 = !DILocation(line: 77, column: 12, scope: !111)
!119 = !DILocation(line: 77, column: 37, scope: !111)
!120 = !DILocation(line: 78, column: 12, scope: !111)
!121 = !DILocation(line: 78, column: 5, scope: !111)
!122 = !DILocation(line: 79, column: 5, scope: !111)
!123 = !DILocation(line: 79, column: 25, scope: !111)
!124 = !DILocation(line: 80, column: 12, scope: !111)
!125 = !DILocation(line: 80, column: 5, scope: !111)
!126 = !DILocation(line: 81, column: 5, scope: !111)
!127 = !DILocation(line: 81, column: 27, scope: !111)
!128 = !DILocation(line: 82, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !111, file: !14, line: 82, column: 8)
!130 = !DILocation(line: 82, column: 8, scope: !111)
!131 = !DILocation(line: 85, column: 9, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !14, line: 83, column: 5)
!133 = !DILocation(line: 86, column: 5, scope: !132)
!134 = !DILocation(line: 90, column: 16, scope: !135)
!135 = distinct !DILexicalBlock(scope: !129, file: !14, line: 88, column: 5)
!136 = !DILocation(line: 90, column: 14, scope: !135)
!137 = !DILocalVariable(name: "i", scope: !138, file: !14, line: 93, type: !42)
!138 = distinct !DILexicalBlock(scope: !111, file: !14, line: 92, column: 5)
!139 = !DILocation(line: 93, column: 16, scope: !138)
!140 = !DILocalVariable(name: "destLen", scope: !138, file: !14, line: 93, type: !42)
!141 = !DILocation(line: 93, column: 19, scope: !138)
!142 = !DILocalVariable(name: "dest", scope: !138, file: !14, line: 94, type: !49)
!143 = !DILocation(line: 94, column: 14, scope: !138)
!144 = !DILocation(line: 95, column: 9, scope: !138)
!145 = !DILocation(line: 96, column: 9, scope: !138)
!146 = !DILocation(line: 96, column: 21, scope: !138)
!147 = !DILocation(line: 97, column: 26, scope: !138)
!148 = !DILocation(line: 97, column: 19, scope: !138)
!149 = !DILocation(line: 97, column: 17, scope: !138)
!150 = !DILocation(line: 100, column: 16, scope: !151)
!151 = distinct !DILexicalBlock(scope: !138, file: !14, line: 100, column: 9)
!152 = !DILocation(line: 100, column: 14, scope: !151)
!153 = !DILocation(line: 100, column: 21, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !14, line: 100, column: 9)
!155 = !DILocation(line: 100, column: 25, scope: !154)
!156 = !DILocation(line: 100, column: 23, scope: !154)
!157 = !DILocation(line: 100, column: 9, scope: !151)
!158 = !DILocation(line: 102, column: 23, scope: !159)
!159 = distinct !DILexicalBlock(scope: !154, file: !14, line: 101, column: 9)
!160 = !DILocation(line: 102, column: 28, scope: !159)
!161 = !DILocation(line: 102, column: 18, scope: !159)
!162 = !DILocation(line: 102, column: 13, scope: !159)
!163 = !DILocation(line: 102, column: 21, scope: !159)
!164 = !DILocation(line: 103, column: 9, scope: !159)
!165 = !DILocation(line: 100, column: 35, scope: !154)
!166 = !DILocation(line: 100, column: 9, scope: !154)
!167 = distinct !{!167, !157, !168, !78}
!168 = !DILocation(line: 103, column: 9, scope: !151)
!169 = !DILocation(line: 104, column: 9, scope: !138)
!170 = !DILocation(line: 104, column: 21, scope: !138)
!171 = !DILocation(line: 105, column: 19, scope: !138)
!172 = !DILocation(line: 105, column: 9, scope: !138)
!173 = !DILocation(line: 107, column: 1, scope: !111)
!174 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !14, file: !14, line: 30, type: !108, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!175 = !DILocation(line: 32, column: 5, scope: !174)
!176 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 110, type: !15, scopeLine: 111, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!177 = !DILocalVariable(name: "data", scope: !176, file: !14, line: 112, type: !4)
!178 = !DILocation(line: 112, column: 12, scope: !176)
!179 = !DILocalVariable(name: "dataBadBuffer", scope: !176, file: !14, line: 113, type: !4)
!180 = !DILocation(line: 113, column: 12, scope: !176)
!181 = !DILocation(line: 113, column: 36, scope: !176)
!182 = !DILocalVariable(name: "dataGoodBuffer", scope: !176, file: !14, line: 114, type: !4)
!183 = !DILocation(line: 114, column: 12, scope: !176)
!184 = !DILocation(line: 114, column: 37, scope: !176)
!185 = !DILocation(line: 115, column: 12, scope: !176)
!186 = !DILocation(line: 115, column: 5, scope: !176)
!187 = !DILocation(line: 116, column: 5, scope: !176)
!188 = !DILocation(line: 116, column: 25, scope: !176)
!189 = !DILocation(line: 117, column: 12, scope: !176)
!190 = !DILocation(line: 117, column: 5, scope: !176)
!191 = !DILocation(line: 118, column: 5, scope: !176)
!192 = !DILocation(line: 118, column: 27, scope: !176)
!193 = !DILocation(line: 119, column: 8, scope: !194)
!194 = distinct !DILexicalBlock(scope: !176, file: !14, line: 119, column: 8)
!195 = !DILocation(line: 119, column: 8, scope: !176)
!196 = !DILocation(line: 122, column: 16, scope: !197)
!197 = distinct !DILexicalBlock(scope: !194, file: !14, line: 120, column: 5)
!198 = !DILocation(line: 122, column: 14, scope: !197)
!199 = !DILocation(line: 123, column: 5, scope: !197)
!200 = !DILocalVariable(name: "i", scope: !201, file: !14, line: 125, type: !42)
!201 = distinct !DILexicalBlock(scope: !176, file: !14, line: 124, column: 5)
!202 = !DILocation(line: 125, column: 16, scope: !201)
!203 = !DILocalVariable(name: "destLen", scope: !201, file: !14, line: 125, type: !42)
!204 = !DILocation(line: 125, column: 19, scope: !201)
!205 = !DILocalVariable(name: "dest", scope: !201, file: !14, line: 126, type: !49)
!206 = !DILocation(line: 126, column: 14, scope: !201)
!207 = !DILocation(line: 127, column: 9, scope: !201)
!208 = !DILocation(line: 128, column: 9, scope: !201)
!209 = !DILocation(line: 128, column: 21, scope: !201)
!210 = !DILocation(line: 129, column: 26, scope: !201)
!211 = !DILocation(line: 129, column: 19, scope: !201)
!212 = !DILocation(line: 129, column: 17, scope: !201)
!213 = !DILocation(line: 132, column: 16, scope: !214)
!214 = distinct !DILexicalBlock(scope: !201, file: !14, line: 132, column: 9)
!215 = !DILocation(line: 132, column: 14, scope: !214)
!216 = !DILocation(line: 132, column: 21, scope: !217)
!217 = distinct !DILexicalBlock(scope: !214, file: !14, line: 132, column: 9)
!218 = !DILocation(line: 132, column: 25, scope: !217)
!219 = !DILocation(line: 132, column: 23, scope: !217)
!220 = !DILocation(line: 132, column: 9, scope: !214)
!221 = !DILocation(line: 134, column: 23, scope: !222)
!222 = distinct !DILexicalBlock(scope: !217, file: !14, line: 133, column: 9)
!223 = !DILocation(line: 134, column: 28, scope: !222)
!224 = !DILocation(line: 134, column: 18, scope: !222)
!225 = !DILocation(line: 134, column: 13, scope: !222)
!226 = !DILocation(line: 134, column: 21, scope: !222)
!227 = !DILocation(line: 135, column: 9, scope: !222)
!228 = !DILocation(line: 132, column: 35, scope: !217)
!229 = !DILocation(line: 132, column: 9, scope: !217)
!230 = distinct !{!230, !220, !231, !78}
!231 = !DILocation(line: 135, column: 9, scope: !214)
!232 = !DILocation(line: 136, column: 9, scope: !201)
!233 = !DILocation(line: 136, column: 21, scope: !201)
!234 = !DILocation(line: 137, column: 19, scope: !201)
!235 = !DILocation(line: 137, column: 9, scope: !201)
!236 = !DILocation(line: 139, column: 1, scope: !176)
