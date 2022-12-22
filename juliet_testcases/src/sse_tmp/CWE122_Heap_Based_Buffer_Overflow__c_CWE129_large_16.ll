; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_16.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_16_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  br label %while.body, !dbg !21

while.body:                                       ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !22
  br label %while.end, !dbg !24

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !25

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !26, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !30, metadata !DIExpression()), !dbg !31
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !32
  %0 = bitcast i8* %call to i32*, !dbg !33
  store i32* %0, i32** %buffer, align 8, !dbg !31
  %1 = load i32*, i32** %buffer, align 8, !dbg !34
  %cmp = icmp eq i32* %1, null, !dbg !36
  br i1 %cmp, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %while.body1
  call void @exit(i32 -1) #6, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %while.body1
  store i32 0, i32* %i, align 4, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !43
  %cmp2 = icmp slt i32 %2, 10, !dbg !45
  br i1 %cmp2, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !47
  %4 = load i32, i32* %i, align 4, !dbg !49
  %idxprom = sext i32 %4 to i64, !dbg !47
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !47
  store i32 0, i32* %arrayidx, align 4, !dbg !50
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !52
  %inc = add nsw i32 %5, 1, !dbg !52
  store i32 %inc, i32* %i, align 4, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !57
  %cmp3 = icmp sge i32 %6, 0, !dbg !59
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !60

if.then4:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !61
  %8 = load i32, i32* %data, align 4, !dbg !63
  %idxprom5 = sext i32 %8 to i64, !dbg !61
  %arrayidx6 = getelementptr inbounds i32, i32* %7, i64 %idxprom5, !dbg !61
  store i32 1, i32* %arrayidx6, align 4, !dbg !64
  store i32 0, i32* %i, align 4, !dbg !65
  br label %for.cond7, !dbg !67

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %9 = load i32, i32* %i, align 4, !dbg !68
  %cmp8 = icmp slt i32 %9, 10, !dbg !70
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !71

for.body9:                                        ; preds = %for.cond7
  %10 = load i32*, i32** %buffer, align 8, !dbg !72
  %11 = load i32, i32* %i, align 4, !dbg !74
  %idxprom10 = sext i32 %11 to i64, !dbg !72
  %arrayidx11 = getelementptr inbounds i32, i32* %10, i64 %idxprom10, !dbg !72
  %12 = load i32, i32* %arrayidx11, align 4, !dbg !72
  call void @printIntLine(i32 %12), !dbg !75
  br label %for.inc12, !dbg !76

for.inc12:                                        ; preds = %for.body9
  %13 = load i32, i32* %i, align 4, !dbg !77
  %inc13 = add nsw i32 %13, 1, !dbg !77
  store i32 %inc13, i32* %i, align 4, !dbg !77
  br label %for.cond7, !dbg !78, !llvm.loop !79

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !81

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !82
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %14 = load i32*, i32** %buffer, align 8, !dbg !84
  %15 = bitcast i32* %14 to i8*, !dbg !84
  call void @free(i8* %15) #5, !dbg !85
  br label %while.end16, !dbg !86

while.end16:                                      ; preds = %if.end15
  ret void, !dbg !87
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printIntLine(i32) #4

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_16_good() #0 !dbg !88 {
entry:
  call void @goodB2G(), !dbg !89
  call void @goodG2B(), !dbg !90
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
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_16_good(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_16_bad(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !112 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !113, metadata !DIExpression()), !dbg !114
  store i32 -1, i32* %data, align 4, !dbg !115
  br label %while.body, !dbg !116

while.body:                                       ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !117
  br label %while.end, !dbg !119

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !120

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !121, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !125, metadata !DIExpression()), !dbg !126
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !127
  %0 = bitcast i8* %call to i32*, !dbg !128
  store i32* %0, i32** %buffer, align 8, !dbg !126
  %1 = load i32*, i32** %buffer, align 8, !dbg !129
  %cmp = icmp eq i32* %1, null, !dbg !131
  br i1 %cmp, label %if.then, label %if.end, !dbg !132

if.then:                                          ; preds = %while.body1
  call void @exit(i32 -1) #6, !dbg !133
  unreachable, !dbg !133

if.end:                                           ; preds = %while.body1
  store i32 0, i32* %i, align 4, !dbg !135
  br label %for.cond, !dbg !137

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !138
  %cmp2 = icmp slt i32 %2, 10, !dbg !140
  br i1 %cmp2, label %for.body, label %for.end, !dbg !141

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !142
  %4 = load i32, i32* %i, align 4, !dbg !144
  %idxprom = sext i32 %4 to i64, !dbg !142
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !142
  store i32 0, i32* %arrayidx, align 4, !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !147
  %inc = add nsw i32 %5, 1, !dbg !147
  store i32 %inc, i32* %i, align 4, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !151
  %cmp3 = icmp sge i32 %6, 0, !dbg !153
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !154

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data, align 4, !dbg !155
  %cmp4 = icmp slt i32 %7, 10, !dbg !156
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !157

if.then5:                                         ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !158
  %9 = load i32, i32* %data, align 4, !dbg !160
  %idxprom6 = sext i32 %9 to i64, !dbg !158
  %arrayidx7 = getelementptr inbounds i32, i32* %8, i64 %idxprom6, !dbg !158
  store i32 1, i32* %arrayidx7, align 4, !dbg !161
  store i32 0, i32* %i, align 4, !dbg !162
  br label %for.cond8, !dbg !164

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %10 = load i32, i32* %i, align 4, !dbg !165
  %cmp9 = icmp slt i32 %10, 10, !dbg !167
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !168

for.body10:                                       ; preds = %for.cond8
  %11 = load i32*, i32** %buffer, align 8, !dbg !169
  %12 = load i32, i32* %i, align 4, !dbg !171
  %idxprom11 = sext i32 %12 to i64, !dbg !169
  %arrayidx12 = getelementptr inbounds i32, i32* %11, i64 %idxprom11, !dbg !169
  %13 = load i32, i32* %arrayidx12, align 4, !dbg !169
  call void @printIntLine(i32 %13), !dbg !172
  br label %for.inc13, !dbg !173

for.inc13:                                        ; preds = %for.body10
  %14 = load i32, i32* %i, align 4, !dbg !174
  %inc14 = add nsw i32 %14, 1, !dbg !174
  store i32 %inc14, i32* %i, align 4, !dbg !174
  br label %for.cond8, !dbg !175, !llvm.loop !176

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !178

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !179
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %15 = load i32*, i32** %buffer, align 8, !dbg !181
  %16 = bitcast i32* %15 to i8*, !dbg !181
  call void @free(i8* %16) #5, !dbg !182
  br label %while.end17, !dbg !183

while.end17:                                      ; preds = %if.end16
  ret void, !dbg !184
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !185 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !186, metadata !DIExpression()), !dbg !187
  store i32 -1, i32* %data, align 4, !dbg !188
  br label %while.body, !dbg !189

while.body:                                       ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !190
  br label %while.end, !dbg !192

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !193

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !194, metadata !DIExpression()), !dbg !197
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !198, metadata !DIExpression()), !dbg !199
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !200
  %0 = bitcast i8* %call to i32*, !dbg !201
  store i32* %0, i32** %buffer, align 8, !dbg !199
  %1 = load i32*, i32** %buffer, align 8, !dbg !202
  %cmp = icmp eq i32* %1, null, !dbg !204
  br i1 %cmp, label %if.then, label %if.end, !dbg !205

if.then:                                          ; preds = %while.body1
  call void @exit(i32 -1) #6, !dbg !206
  unreachable, !dbg !206

if.end:                                           ; preds = %while.body1
  store i32 0, i32* %i, align 4, !dbg !208
  br label %for.cond, !dbg !210

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !211
  %cmp2 = icmp slt i32 %2, 10, !dbg !213
  br i1 %cmp2, label %for.body, label %for.end, !dbg !214

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !215
  %4 = load i32, i32* %i, align 4, !dbg !217
  %idxprom = sext i32 %4 to i64, !dbg !215
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !215
  store i32 0, i32* %arrayidx, align 4, !dbg !218
  br label %for.inc, !dbg !219

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !220
  %inc = add nsw i32 %5, 1, !dbg !220
  store i32 %inc, i32* %i, align 4, !dbg !220
  br label %for.cond, !dbg !221, !llvm.loop !222

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !224
  %cmp3 = icmp sge i32 %6, 0, !dbg !226
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !227

if.then4:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !228
  %8 = load i32, i32* %data, align 4, !dbg !230
  %idxprom5 = sext i32 %8 to i64, !dbg !228
  %arrayidx6 = getelementptr inbounds i32, i32* %7, i64 %idxprom5, !dbg !228
  store i32 1, i32* %arrayidx6, align 4, !dbg !231
  store i32 0, i32* %i, align 4, !dbg !232
  br label %for.cond7, !dbg !234

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %9 = load i32, i32* %i, align 4, !dbg !235
  %cmp8 = icmp slt i32 %9, 10, !dbg !237
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !238

for.body9:                                        ; preds = %for.cond7
  %10 = load i32*, i32** %buffer, align 8, !dbg !239
  %11 = load i32, i32* %i, align 4, !dbg !241
  %idxprom10 = sext i32 %11 to i64, !dbg !239
  %arrayidx11 = getelementptr inbounds i32, i32* %10, i64 %idxprom10, !dbg !239
  %12 = load i32, i32* %arrayidx11, align 4, !dbg !239
  call void @printIntLine(i32 %12), !dbg !242
  br label %for.inc12, !dbg !243

for.inc12:                                        ; preds = %for.body9
  %13 = load i32, i32* %i, align 4, !dbg !244
  %inc13 = add nsw i32 %13, 1, !dbg !244
  store i32 %inc13, i32* %i, align 4, !dbg !244
  br label %for.cond7, !dbg !245, !llvm.loop !246

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !248

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !249
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %14 = load i32*, i32** %buffer, align 8, !dbg !251
  %15 = bitcast i32* %14 to i8*, !dbg !251
  call void @free(i8* %15) #5, !dbg !252
  br label %while.end16, !dbg !253

while.end16:                                      ; preds = %if.end15
  ret void, !dbg !254
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_16.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_16_bad", scope: !15, file: !15, line: 22, type: !16, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_16.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 24, type: !5)
!19 = !DILocation(line: 24, column: 9, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 5, scope: !14)
!22 = !DILocation(line: 30, column: 14, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 5)
!24 = !DILocation(line: 31, column: 9, scope: !23)
!25 = !DILocation(line: 33, column: 5, scope: !14)
!26 = !DILocalVariable(name: "i", scope: !27, file: !15, line: 36, type: !5)
!27 = distinct !DILexicalBlock(scope: !28, file: !15, line: 35, column: 9)
!28 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!29 = !DILocation(line: 36, column: 17, scope: !27)
!30 = !DILocalVariable(name: "buffer", scope: !27, file: !15, line: 37, type: !4)
!31 = !DILocation(line: 37, column: 19, scope: !27)
!32 = !DILocation(line: 37, column: 35, scope: !27)
!33 = !DILocation(line: 37, column: 28, scope: !27)
!34 = !DILocation(line: 38, column: 17, scope: !35)
!35 = distinct !DILexicalBlock(scope: !27, file: !15, line: 38, column: 17)
!36 = !DILocation(line: 38, column: 24, scope: !35)
!37 = !DILocation(line: 38, column: 17, scope: !27)
!38 = !DILocation(line: 38, column: 34, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !15, line: 38, column: 33)
!40 = !DILocation(line: 40, column: 20, scope: !41)
!41 = distinct !DILexicalBlock(scope: !27, file: !15, line: 40, column: 13)
!42 = !DILocation(line: 40, column: 18, scope: !41)
!43 = !DILocation(line: 40, column: 25, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !15, line: 40, column: 13)
!45 = !DILocation(line: 40, column: 27, scope: !44)
!46 = !DILocation(line: 40, column: 13, scope: !41)
!47 = !DILocation(line: 42, column: 17, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !15, line: 41, column: 13)
!49 = !DILocation(line: 42, column: 24, scope: !48)
!50 = !DILocation(line: 42, column: 27, scope: !48)
!51 = !DILocation(line: 43, column: 13, scope: !48)
!52 = !DILocation(line: 40, column: 34, scope: !44)
!53 = !DILocation(line: 40, column: 13, scope: !44)
!54 = distinct !{!54, !46, !55, !56}
!55 = !DILocation(line: 43, column: 13, scope: !41)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocation(line: 46, column: 17, scope: !58)
!58 = distinct !DILexicalBlock(scope: !27, file: !15, line: 46, column: 17)
!59 = !DILocation(line: 46, column: 22, scope: !58)
!60 = !DILocation(line: 46, column: 17, scope: !27)
!61 = !DILocation(line: 48, column: 17, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !15, line: 47, column: 13)
!63 = !DILocation(line: 48, column: 24, scope: !62)
!64 = !DILocation(line: 48, column: 30, scope: !62)
!65 = !DILocation(line: 50, column: 23, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !15, line: 50, column: 17)
!67 = !DILocation(line: 50, column: 21, scope: !66)
!68 = !DILocation(line: 50, column: 28, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !15, line: 50, column: 17)
!70 = !DILocation(line: 50, column: 30, scope: !69)
!71 = !DILocation(line: 50, column: 17, scope: !66)
!72 = !DILocation(line: 52, column: 34, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !15, line: 51, column: 17)
!74 = !DILocation(line: 52, column: 41, scope: !73)
!75 = !DILocation(line: 52, column: 21, scope: !73)
!76 = !DILocation(line: 53, column: 17, scope: !73)
!77 = !DILocation(line: 50, column: 37, scope: !69)
!78 = !DILocation(line: 50, column: 17, scope: !69)
!79 = distinct !{!79, !71, !80, !56}
!80 = !DILocation(line: 53, column: 17, scope: !66)
!81 = !DILocation(line: 54, column: 13, scope: !62)
!82 = !DILocation(line: 57, column: 17, scope: !83)
!83 = distinct !DILexicalBlock(scope: !58, file: !15, line: 56, column: 13)
!84 = !DILocation(line: 59, column: 18, scope: !27)
!85 = !DILocation(line: 59, column: 13, scope: !27)
!86 = !DILocation(line: 61, column: 9, scope: !28)
!87 = !DILocation(line: 63, column: 1, scope: !14)
!88 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_16_good", scope: !15, file: !15, line: 157, type: !16, scopeLine: 158, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocation(line: 159, column: 5, scope: !88)
!90 = !DILocation(line: 160, column: 5, scope: !88)
!91 = !DILocation(line: 161, column: 1, scope: !88)
!92 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 172, type: !93, scopeLine: 173, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DISubroutineType(types: !94)
!94 = !{!5, !5, !95}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !15, line: 172, type: !5)
!99 = !DILocation(line: 172, column: 14, scope: !92)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !15, line: 172, type: !95)
!101 = !DILocation(line: 172, column: 27, scope: !92)
!102 = !DILocation(line: 175, column: 22, scope: !92)
!103 = !DILocation(line: 175, column: 12, scope: !92)
!104 = !DILocation(line: 175, column: 5, scope: !92)
!105 = !DILocation(line: 177, column: 5, scope: !92)
!106 = !DILocation(line: 178, column: 5, scope: !92)
!107 = !DILocation(line: 179, column: 5, scope: !92)
!108 = !DILocation(line: 182, column: 5, scope: !92)
!109 = !DILocation(line: 183, column: 5, scope: !92)
!110 = !DILocation(line: 184, column: 5, scope: !92)
!111 = !DILocation(line: 186, column: 5, scope: !92)
!112 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 70, type: !16, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", scope: !112, file: !15, line: 72, type: !5)
!114 = !DILocation(line: 72, column: 9, scope: !112)
!115 = !DILocation(line: 74, column: 10, scope: !112)
!116 = !DILocation(line: 75, column: 5, scope: !112)
!117 = !DILocation(line: 78, column: 14, scope: !118)
!118 = distinct !DILexicalBlock(scope: !112, file: !15, line: 76, column: 5)
!119 = !DILocation(line: 79, column: 9, scope: !118)
!120 = !DILocation(line: 81, column: 5, scope: !112)
!121 = !DILocalVariable(name: "i", scope: !122, file: !15, line: 84, type: !5)
!122 = distinct !DILexicalBlock(scope: !123, file: !15, line: 83, column: 9)
!123 = distinct !DILexicalBlock(scope: !112, file: !15, line: 82, column: 5)
!124 = !DILocation(line: 84, column: 17, scope: !122)
!125 = !DILocalVariable(name: "buffer", scope: !122, file: !15, line: 85, type: !4)
!126 = !DILocation(line: 85, column: 19, scope: !122)
!127 = !DILocation(line: 85, column: 35, scope: !122)
!128 = !DILocation(line: 85, column: 28, scope: !122)
!129 = !DILocation(line: 86, column: 17, scope: !130)
!130 = distinct !DILexicalBlock(scope: !122, file: !15, line: 86, column: 17)
!131 = !DILocation(line: 86, column: 24, scope: !130)
!132 = !DILocation(line: 86, column: 17, scope: !122)
!133 = !DILocation(line: 86, column: 34, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !15, line: 86, column: 33)
!135 = !DILocation(line: 88, column: 20, scope: !136)
!136 = distinct !DILexicalBlock(scope: !122, file: !15, line: 88, column: 13)
!137 = !DILocation(line: 88, column: 18, scope: !136)
!138 = !DILocation(line: 88, column: 25, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !15, line: 88, column: 13)
!140 = !DILocation(line: 88, column: 27, scope: !139)
!141 = !DILocation(line: 88, column: 13, scope: !136)
!142 = !DILocation(line: 90, column: 17, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !15, line: 89, column: 13)
!144 = !DILocation(line: 90, column: 24, scope: !143)
!145 = !DILocation(line: 90, column: 27, scope: !143)
!146 = !DILocation(line: 91, column: 13, scope: !143)
!147 = !DILocation(line: 88, column: 34, scope: !139)
!148 = !DILocation(line: 88, column: 13, scope: !139)
!149 = distinct !{!149, !141, !150, !56}
!150 = !DILocation(line: 91, column: 13, scope: !136)
!151 = !DILocation(line: 93, column: 17, scope: !152)
!152 = distinct !DILexicalBlock(scope: !122, file: !15, line: 93, column: 17)
!153 = !DILocation(line: 93, column: 22, scope: !152)
!154 = !DILocation(line: 93, column: 27, scope: !152)
!155 = !DILocation(line: 93, column: 30, scope: !152)
!156 = !DILocation(line: 93, column: 35, scope: !152)
!157 = !DILocation(line: 93, column: 17, scope: !122)
!158 = !DILocation(line: 95, column: 17, scope: !159)
!159 = distinct !DILexicalBlock(scope: !152, file: !15, line: 94, column: 13)
!160 = !DILocation(line: 95, column: 24, scope: !159)
!161 = !DILocation(line: 95, column: 30, scope: !159)
!162 = !DILocation(line: 97, column: 23, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !15, line: 97, column: 17)
!164 = !DILocation(line: 97, column: 21, scope: !163)
!165 = !DILocation(line: 97, column: 28, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !15, line: 97, column: 17)
!167 = !DILocation(line: 97, column: 30, scope: !166)
!168 = !DILocation(line: 97, column: 17, scope: !163)
!169 = !DILocation(line: 99, column: 34, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !15, line: 98, column: 17)
!171 = !DILocation(line: 99, column: 41, scope: !170)
!172 = !DILocation(line: 99, column: 21, scope: !170)
!173 = !DILocation(line: 100, column: 17, scope: !170)
!174 = !DILocation(line: 97, column: 37, scope: !166)
!175 = !DILocation(line: 97, column: 17, scope: !166)
!176 = distinct !{!176, !168, !177, !56}
!177 = !DILocation(line: 100, column: 17, scope: !163)
!178 = !DILocation(line: 101, column: 13, scope: !159)
!179 = !DILocation(line: 104, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !152, file: !15, line: 103, column: 13)
!181 = !DILocation(line: 106, column: 18, scope: !122)
!182 = !DILocation(line: 106, column: 13, scope: !122)
!183 = !DILocation(line: 108, column: 9, scope: !123)
!184 = !DILocation(line: 110, column: 1, scope: !112)
!185 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 113, type: !16, scopeLine: 114, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!186 = !DILocalVariable(name: "data", scope: !185, file: !15, line: 115, type: !5)
!187 = !DILocation(line: 115, column: 9, scope: !185)
!188 = !DILocation(line: 117, column: 10, scope: !185)
!189 = !DILocation(line: 118, column: 5, scope: !185)
!190 = !DILocation(line: 122, column: 14, scope: !191)
!191 = distinct !DILexicalBlock(scope: !185, file: !15, line: 119, column: 5)
!192 = !DILocation(line: 123, column: 9, scope: !191)
!193 = !DILocation(line: 125, column: 5, scope: !185)
!194 = !DILocalVariable(name: "i", scope: !195, file: !15, line: 128, type: !5)
!195 = distinct !DILexicalBlock(scope: !196, file: !15, line: 127, column: 9)
!196 = distinct !DILexicalBlock(scope: !185, file: !15, line: 126, column: 5)
!197 = !DILocation(line: 128, column: 17, scope: !195)
!198 = !DILocalVariable(name: "buffer", scope: !195, file: !15, line: 129, type: !4)
!199 = !DILocation(line: 129, column: 19, scope: !195)
!200 = !DILocation(line: 129, column: 35, scope: !195)
!201 = !DILocation(line: 129, column: 28, scope: !195)
!202 = !DILocation(line: 130, column: 17, scope: !203)
!203 = distinct !DILexicalBlock(scope: !195, file: !15, line: 130, column: 17)
!204 = !DILocation(line: 130, column: 24, scope: !203)
!205 = !DILocation(line: 130, column: 17, scope: !195)
!206 = !DILocation(line: 130, column: 34, scope: !207)
!207 = distinct !DILexicalBlock(scope: !203, file: !15, line: 130, column: 33)
!208 = !DILocation(line: 132, column: 20, scope: !209)
!209 = distinct !DILexicalBlock(scope: !195, file: !15, line: 132, column: 13)
!210 = !DILocation(line: 132, column: 18, scope: !209)
!211 = !DILocation(line: 132, column: 25, scope: !212)
!212 = distinct !DILexicalBlock(scope: !209, file: !15, line: 132, column: 13)
!213 = !DILocation(line: 132, column: 27, scope: !212)
!214 = !DILocation(line: 132, column: 13, scope: !209)
!215 = !DILocation(line: 134, column: 17, scope: !216)
!216 = distinct !DILexicalBlock(scope: !212, file: !15, line: 133, column: 13)
!217 = !DILocation(line: 134, column: 24, scope: !216)
!218 = !DILocation(line: 134, column: 27, scope: !216)
!219 = !DILocation(line: 135, column: 13, scope: !216)
!220 = !DILocation(line: 132, column: 34, scope: !212)
!221 = !DILocation(line: 132, column: 13, scope: !212)
!222 = distinct !{!222, !214, !223, !56}
!223 = !DILocation(line: 135, column: 13, scope: !209)
!224 = !DILocation(line: 138, column: 17, scope: !225)
!225 = distinct !DILexicalBlock(scope: !195, file: !15, line: 138, column: 17)
!226 = !DILocation(line: 138, column: 22, scope: !225)
!227 = !DILocation(line: 138, column: 17, scope: !195)
!228 = !DILocation(line: 140, column: 17, scope: !229)
!229 = distinct !DILexicalBlock(scope: !225, file: !15, line: 139, column: 13)
!230 = !DILocation(line: 140, column: 24, scope: !229)
!231 = !DILocation(line: 140, column: 30, scope: !229)
!232 = !DILocation(line: 142, column: 23, scope: !233)
!233 = distinct !DILexicalBlock(scope: !229, file: !15, line: 142, column: 17)
!234 = !DILocation(line: 142, column: 21, scope: !233)
!235 = !DILocation(line: 142, column: 28, scope: !236)
!236 = distinct !DILexicalBlock(scope: !233, file: !15, line: 142, column: 17)
!237 = !DILocation(line: 142, column: 30, scope: !236)
!238 = !DILocation(line: 142, column: 17, scope: !233)
!239 = !DILocation(line: 144, column: 34, scope: !240)
!240 = distinct !DILexicalBlock(scope: !236, file: !15, line: 143, column: 17)
!241 = !DILocation(line: 144, column: 41, scope: !240)
!242 = !DILocation(line: 144, column: 21, scope: !240)
!243 = !DILocation(line: 145, column: 17, scope: !240)
!244 = !DILocation(line: 142, column: 37, scope: !236)
!245 = !DILocation(line: 142, column: 17, scope: !236)
!246 = distinct !{!246, !238, !247, !56}
!247 = !DILocation(line: 145, column: 17, scope: !233)
!248 = !DILocation(line: 146, column: 13, scope: !229)
!249 = !DILocation(line: 149, column: 17, scope: !250)
!250 = distinct !DILexicalBlock(scope: !225, file: !15, line: 148, column: 13)
!251 = !DILocation(line: 151, column: 18, scope: !195)
!252 = !DILocation(line: 151, column: 13, scope: !195)
!253 = !DILocation(line: 153, column: 9, scope: !196)
!254 = !DILocation(line: 155, column: 1, scope: !185)
