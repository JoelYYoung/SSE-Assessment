; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_01.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_01_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 -1, i32* %data, align 4, !dbg !20
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !21
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !23, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !26, metadata !DIExpression()), !dbg !27
  %call1 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !28
  %1 = bitcast i8* %call1 to i32*, !dbg !29
  store i32* %1, i32** %buffer, align 8, !dbg !27
  %2 = load i32*, i32** %buffer, align 8, !dbg !30
  %cmp = icmp eq i32* %2, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !39
  %cmp2 = icmp slt i32 %3, 10, !dbg !41
  br i1 %cmp2, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !43
  %5 = load i32, i32* %i, align 4, !dbg !45
  %idxprom = sext i32 %5 to i64, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !46
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !48
  %inc = add nsw i32 %6, 1, !dbg !48
  store i32 %inc, i32* %i, align 4, !dbg !48
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !53
  %cmp3 = icmp sge i32 %7, 0, !dbg !55
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !56

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !57
  %9 = load i32, i32* %data, align 4, !dbg !59
  %idxprom5 = sext i32 %9 to i64, !dbg !57
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !57
  store i32 1, i32* %arrayidx6, align 4, !dbg !60
  store i32 0, i32* %i, align 4, !dbg !61
  br label %for.cond7, !dbg !63

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !64
  %cmp8 = icmp slt i32 %10, 10, !dbg !66
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !67

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !68
  %12 = load i32, i32* %i, align 4, !dbg !70
  %idxprom10 = sext i32 %12 to i64, !dbg !68
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !68
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !68
  call void @printIntLine(i32 %13), !dbg !71
  br label %for.inc12, !dbg !72

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !73
  %inc13 = add nsw i32 %14, 1, !dbg !73
  store i32 %inc13, i32* %i, align 4, !dbg !73
  br label %for.cond7, !dbg !74, !llvm.loop !75

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !77

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !80
  %16 = bitcast i32* %15 to i8*, !dbg !80
  call void @free(i8* %16) #5, !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

declare dso_local void @printIntLine(i32) #2

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_01_good() #0 !dbg !83 {
entry:
  call void @goodG2B(), !dbg !84
  call void @goodB2G(), !dbg !85
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
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_01_good(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !103
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_01_bad(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !107 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !108, metadata !DIExpression()), !dbg !109
  store i32 -1, i32* %data, align 4, !dbg !110
  store i32 7, i32* %data, align 4, !dbg !111
  call void @llvm.dbg.declare(metadata i32* %i, metadata !112, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !115, metadata !DIExpression()), !dbg !116
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !117
  %0 = bitcast i8* %call to i32*, !dbg !118
  store i32* %0, i32** %buffer, align 8, !dbg !116
  %1 = load i32*, i32** %buffer, align 8, !dbg !119
  %cmp = icmp eq i32* %1, null, !dbg !121
  br i1 %cmp, label %if.then, label %if.end, !dbg !122

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !123
  unreachable, !dbg !123

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !125
  br label %for.cond, !dbg !127

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !128
  %cmp1 = icmp slt i32 %2, 10, !dbg !130
  br i1 %cmp1, label %for.body, label %for.end, !dbg !131

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !132
  %4 = load i32, i32* %i, align 4, !dbg !134
  %idxprom = sext i32 %4 to i64, !dbg !132
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !132
  store i32 0, i32* %arrayidx, align 4, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !137
  %inc = add nsw i32 %5, 1, !dbg !137
  store i32 %inc, i32* %i, align 4, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !141
  %cmp2 = icmp sge i32 %6, 0, !dbg !143
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !144

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !145
  %8 = load i32, i32* %data, align 4, !dbg !147
  %idxprom4 = sext i32 %8 to i64, !dbg !145
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !145
  store i32 1, i32* %arrayidx5, align 4, !dbg !148
  store i32 0, i32* %i, align 4, !dbg !149
  br label %for.cond6, !dbg !151

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !152
  %cmp7 = icmp slt i32 %9, 10, !dbg !154
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !155

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !156
  %11 = load i32, i32* %i, align 4, !dbg !158
  %idxprom9 = sext i32 %11 to i64, !dbg !156
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !156
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !156
  call void @printIntLine(i32 %12), !dbg !159
  br label %for.inc11, !dbg !160

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !161
  %inc12 = add nsw i32 %13, 1, !dbg !161
  store i32 %inc12, i32* %i, align 4, !dbg !161
  br label %for.cond6, !dbg !162, !llvm.loop !163

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !165

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !166
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !168
  %15 = bitcast i32* %14 to i8*, !dbg !168
  call void @free(i8* %15) #5, !dbg !169
  ret void, !dbg !170
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !171 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !172, metadata !DIExpression()), !dbg !173
  store i32 -1, i32* %data, align 4, !dbg !174
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !175
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !176
  call void @llvm.dbg.declare(metadata i32* %i, metadata !177, metadata !DIExpression()), !dbg !179
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !180, metadata !DIExpression()), !dbg !181
  %call1 = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !182
  %1 = bitcast i8* %call1 to i32*, !dbg !183
  store i32* %1, i32** %buffer, align 8, !dbg !181
  %2 = load i32*, i32** %buffer, align 8, !dbg !184
  %cmp = icmp eq i32* %2, null, !dbg !186
  br i1 %cmp, label %if.then, label %if.end, !dbg !187

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !188
  unreachable, !dbg !188

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !190
  br label %for.cond, !dbg !192

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !193
  %cmp2 = icmp slt i32 %3, 10, !dbg !195
  br i1 %cmp2, label %for.body, label %for.end, !dbg !196

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !197
  %5 = load i32, i32* %i, align 4, !dbg !199
  %idxprom = sext i32 %5 to i64, !dbg !197
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !197
  store i32 0, i32* %arrayidx, align 4, !dbg !200
  br label %for.inc, !dbg !201

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !202
  %inc = add nsw i32 %6, 1, !dbg !202
  store i32 %inc, i32* %i, align 4, !dbg !202
  br label %for.cond, !dbg !203, !llvm.loop !204

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !206
  %cmp3 = icmp sge i32 %7, 0, !dbg !208
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !209

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data, align 4, !dbg !210
  %cmp4 = icmp slt i32 %8, 10, !dbg !211
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !212

if.then5:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !213
  %10 = load i32, i32* %data, align 4, !dbg !215
  %idxprom6 = sext i32 %10 to i64, !dbg !213
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %idxprom6, !dbg !213
  store i32 1, i32* %arrayidx7, align 4, !dbg !216
  store i32 0, i32* %i, align 4, !dbg !217
  br label %for.cond8, !dbg !219

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %11 = load i32, i32* %i, align 4, !dbg !220
  %cmp9 = icmp slt i32 %11, 10, !dbg !222
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !223

for.body10:                                       ; preds = %for.cond8
  %12 = load i32*, i32** %buffer, align 8, !dbg !224
  %13 = load i32, i32* %i, align 4, !dbg !226
  %idxprom11 = sext i32 %13 to i64, !dbg !224
  %arrayidx12 = getelementptr inbounds i32, i32* %12, i64 %idxprom11, !dbg !224
  %14 = load i32, i32* %arrayidx12, align 4, !dbg !224
  call void @printIntLine(i32 %14), !dbg !227
  br label %for.inc13, !dbg !228

for.inc13:                                        ; preds = %for.body10
  %15 = load i32, i32* %i, align 4, !dbg !229
  %inc14 = add nsw i32 %15, 1, !dbg !229
  store i32 %inc14, i32* %i, align 4, !dbg !229
  br label %for.cond8, !dbg !230, !llvm.loop !231

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !233

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !234
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %16 = load i32*, i32** %buffer, align 8, !dbg !236
  %17 = bitcast i32* %16 to i8*, !dbg !236
  call void @free(i8* %17) #5, !dbg !237
  ret void, !dbg !238
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_01.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_01_bad", scope: !15, file: !15, line: 22, type: !16, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_01.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 24, type: !5)
!19 = !DILocation(line: 24, column: 9, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 28, column: 12, scope: !14)
!22 = !DILocation(line: 28, column: 5, scope: !14)
!23 = !DILocalVariable(name: "i", scope: !24, file: !15, line: 30, type: !5)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 5)
!25 = !DILocation(line: 30, column: 13, scope: !24)
!26 = !DILocalVariable(name: "buffer", scope: !24, file: !15, line: 31, type: !4)
!27 = !DILocation(line: 31, column: 15, scope: !24)
!28 = !DILocation(line: 31, column: 31, scope: !24)
!29 = !DILocation(line: 31, column: 24, scope: !24)
!30 = !DILocation(line: 32, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !24, file: !15, line: 32, column: 13)
!32 = !DILocation(line: 32, column: 20, scope: !31)
!33 = !DILocation(line: 32, column: 13, scope: !24)
!34 = !DILocation(line: 32, column: 30, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !15, line: 32, column: 29)
!36 = !DILocation(line: 34, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !24, file: !15, line: 34, column: 9)
!38 = !DILocation(line: 34, column: 14, scope: !37)
!39 = !DILocation(line: 34, column: 21, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !15, line: 34, column: 9)
!41 = !DILocation(line: 34, column: 23, scope: !40)
!42 = !DILocation(line: 34, column: 9, scope: !37)
!43 = !DILocation(line: 36, column: 13, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !15, line: 35, column: 9)
!45 = !DILocation(line: 36, column: 20, scope: !44)
!46 = !DILocation(line: 36, column: 23, scope: !44)
!47 = !DILocation(line: 37, column: 9, scope: !44)
!48 = !DILocation(line: 34, column: 30, scope: !40)
!49 = !DILocation(line: 34, column: 9, scope: !40)
!50 = distinct !{!50, !42, !51, !52}
!51 = !DILocation(line: 37, column: 9, scope: !37)
!52 = !{!"llvm.loop.mustprogress"}
!53 = !DILocation(line: 40, column: 13, scope: !54)
!54 = distinct !DILexicalBlock(scope: !24, file: !15, line: 40, column: 13)
!55 = !DILocation(line: 40, column: 18, scope: !54)
!56 = !DILocation(line: 40, column: 13, scope: !24)
!57 = !DILocation(line: 42, column: 13, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !15, line: 41, column: 9)
!59 = !DILocation(line: 42, column: 20, scope: !58)
!60 = !DILocation(line: 42, column: 26, scope: !58)
!61 = !DILocation(line: 44, column: 19, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !15, line: 44, column: 13)
!63 = !DILocation(line: 44, column: 17, scope: !62)
!64 = !DILocation(line: 44, column: 24, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !15, line: 44, column: 13)
!66 = !DILocation(line: 44, column: 26, scope: !65)
!67 = !DILocation(line: 44, column: 13, scope: !62)
!68 = !DILocation(line: 46, column: 30, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !15, line: 45, column: 13)
!70 = !DILocation(line: 46, column: 37, scope: !69)
!71 = !DILocation(line: 46, column: 17, scope: !69)
!72 = !DILocation(line: 47, column: 13, scope: !69)
!73 = !DILocation(line: 44, column: 33, scope: !65)
!74 = !DILocation(line: 44, column: 13, scope: !65)
!75 = distinct !{!75, !67, !76, !52}
!76 = !DILocation(line: 47, column: 13, scope: !62)
!77 = !DILocation(line: 48, column: 9, scope: !58)
!78 = !DILocation(line: 51, column: 13, scope: !79)
!79 = distinct !DILexicalBlock(scope: !54, file: !15, line: 50, column: 9)
!80 = !DILocation(line: 53, column: 14, scope: !24)
!81 = !DILocation(line: 53, column: 9, scope: !24)
!82 = !DILocation(line: 55, column: 1, scope: !14)
!83 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_01_good", scope: !15, file: !15, line: 133, type: !16, scopeLine: 134, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocation(line: 135, column: 5, scope: !83)
!85 = !DILocation(line: 136, column: 5, scope: !83)
!86 = !DILocation(line: 137, column: 1, scope: !83)
!87 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 148, type: !88, scopeLine: 149, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DISubroutineType(types: !89)
!89 = !{!5, !5, !90}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !15, line: 148, type: !5)
!94 = !DILocation(line: 148, column: 14, scope: !87)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !15, line: 148, type: !90)
!96 = !DILocation(line: 148, column: 27, scope: !87)
!97 = !DILocation(line: 151, column: 22, scope: !87)
!98 = !DILocation(line: 151, column: 12, scope: !87)
!99 = !DILocation(line: 151, column: 5, scope: !87)
!100 = !DILocation(line: 153, column: 5, scope: !87)
!101 = !DILocation(line: 154, column: 5, scope: !87)
!102 = !DILocation(line: 155, column: 5, scope: !87)
!103 = !DILocation(line: 158, column: 5, scope: !87)
!104 = !DILocation(line: 159, column: 5, scope: !87)
!105 = !DILocation(line: 160, column: 5, scope: !87)
!106 = !DILocation(line: 162, column: 5, scope: !87)
!107 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 62, type: !16, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !15, line: 64, type: !5)
!109 = !DILocation(line: 64, column: 9, scope: !107)
!110 = !DILocation(line: 66, column: 10, scope: !107)
!111 = !DILocation(line: 69, column: 10, scope: !107)
!112 = !DILocalVariable(name: "i", scope: !113, file: !15, line: 71, type: !5)
!113 = distinct !DILexicalBlock(scope: !107, file: !15, line: 70, column: 5)
!114 = !DILocation(line: 71, column: 13, scope: !113)
!115 = !DILocalVariable(name: "buffer", scope: !113, file: !15, line: 72, type: !4)
!116 = !DILocation(line: 72, column: 15, scope: !113)
!117 = !DILocation(line: 72, column: 31, scope: !113)
!118 = !DILocation(line: 72, column: 24, scope: !113)
!119 = !DILocation(line: 73, column: 13, scope: !120)
!120 = distinct !DILexicalBlock(scope: !113, file: !15, line: 73, column: 13)
!121 = !DILocation(line: 73, column: 20, scope: !120)
!122 = !DILocation(line: 73, column: 13, scope: !113)
!123 = !DILocation(line: 73, column: 30, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !15, line: 73, column: 29)
!125 = !DILocation(line: 75, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !113, file: !15, line: 75, column: 9)
!127 = !DILocation(line: 75, column: 14, scope: !126)
!128 = !DILocation(line: 75, column: 21, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !15, line: 75, column: 9)
!130 = !DILocation(line: 75, column: 23, scope: !129)
!131 = !DILocation(line: 75, column: 9, scope: !126)
!132 = !DILocation(line: 77, column: 13, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !15, line: 76, column: 9)
!134 = !DILocation(line: 77, column: 20, scope: !133)
!135 = !DILocation(line: 77, column: 23, scope: !133)
!136 = !DILocation(line: 78, column: 9, scope: !133)
!137 = !DILocation(line: 75, column: 30, scope: !129)
!138 = !DILocation(line: 75, column: 9, scope: !129)
!139 = distinct !{!139, !131, !140, !52}
!140 = !DILocation(line: 78, column: 9, scope: !126)
!141 = !DILocation(line: 81, column: 13, scope: !142)
!142 = distinct !DILexicalBlock(scope: !113, file: !15, line: 81, column: 13)
!143 = !DILocation(line: 81, column: 18, scope: !142)
!144 = !DILocation(line: 81, column: 13, scope: !113)
!145 = !DILocation(line: 83, column: 13, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !15, line: 82, column: 9)
!147 = !DILocation(line: 83, column: 20, scope: !146)
!148 = !DILocation(line: 83, column: 26, scope: !146)
!149 = !DILocation(line: 85, column: 19, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !15, line: 85, column: 13)
!151 = !DILocation(line: 85, column: 17, scope: !150)
!152 = !DILocation(line: 85, column: 24, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !15, line: 85, column: 13)
!154 = !DILocation(line: 85, column: 26, scope: !153)
!155 = !DILocation(line: 85, column: 13, scope: !150)
!156 = !DILocation(line: 87, column: 30, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !15, line: 86, column: 13)
!158 = !DILocation(line: 87, column: 37, scope: !157)
!159 = !DILocation(line: 87, column: 17, scope: !157)
!160 = !DILocation(line: 88, column: 13, scope: !157)
!161 = !DILocation(line: 85, column: 33, scope: !153)
!162 = !DILocation(line: 85, column: 13, scope: !153)
!163 = distinct !{!163, !155, !164, !52}
!164 = !DILocation(line: 88, column: 13, scope: !150)
!165 = !DILocation(line: 89, column: 9, scope: !146)
!166 = !DILocation(line: 92, column: 13, scope: !167)
!167 = distinct !DILexicalBlock(scope: !142, file: !15, line: 91, column: 9)
!168 = !DILocation(line: 94, column: 14, scope: !113)
!169 = !DILocation(line: 94, column: 9, scope: !113)
!170 = !DILocation(line: 96, column: 1, scope: !107)
!171 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 99, type: !16, scopeLine: 100, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!172 = !DILocalVariable(name: "data", scope: !171, file: !15, line: 101, type: !5)
!173 = !DILocation(line: 101, column: 9, scope: !171)
!174 = !DILocation(line: 103, column: 10, scope: !171)
!175 = !DILocation(line: 105, column: 12, scope: !171)
!176 = !DILocation(line: 105, column: 5, scope: !171)
!177 = !DILocalVariable(name: "i", scope: !178, file: !15, line: 107, type: !5)
!178 = distinct !DILexicalBlock(scope: !171, file: !15, line: 106, column: 5)
!179 = !DILocation(line: 107, column: 13, scope: !178)
!180 = !DILocalVariable(name: "buffer", scope: !178, file: !15, line: 108, type: !4)
!181 = !DILocation(line: 108, column: 15, scope: !178)
!182 = !DILocation(line: 108, column: 31, scope: !178)
!183 = !DILocation(line: 108, column: 24, scope: !178)
!184 = !DILocation(line: 109, column: 13, scope: !185)
!185 = distinct !DILexicalBlock(scope: !178, file: !15, line: 109, column: 13)
!186 = !DILocation(line: 109, column: 20, scope: !185)
!187 = !DILocation(line: 109, column: 13, scope: !178)
!188 = !DILocation(line: 109, column: 30, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !15, line: 109, column: 29)
!190 = !DILocation(line: 111, column: 16, scope: !191)
!191 = distinct !DILexicalBlock(scope: !178, file: !15, line: 111, column: 9)
!192 = !DILocation(line: 111, column: 14, scope: !191)
!193 = !DILocation(line: 111, column: 21, scope: !194)
!194 = distinct !DILexicalBlock(scope: !191, file: !15, line: 111, column: 9)
!195 = !DILocation(line: 111, column: 23, scope: !194)
!196 = !DILocation(line: 111, column: 9, scope: !191)
!197 = !DILocation(line: 113, column: 13, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !15, line: 112, column: 9)
!199 = !DILocation(line: 113, column: 20, scope: !198)
!200 = !DILocation(line: 113, column: 23, scope: !198)
!201 = !DILocation(line: 114, column: 9, scope: !198)
!202 = !DILocation(line: 111, column: 30, scope: !194)
!203 = !DILocation(line: 111, column: 9, scope: !194)
!204 = distinct !{!204, !196, !205, !52}
!205 = !DILocation(line: 114, column: 9, scope: !191)
!206 = !DILocation(line: 116, column: 13, scope: !207)
!207 = distinct !DILexicalBlock(scope: !178, file: !15, line: 116, column: 13)
!208 = !DILocation(line: 116, column: 18, scope: !207)
!209 = !DILocation(line: 116, column: 23, scope: !207)
!210 = !DILocation(line: 116, column: 26, scope: !207)
!211 = !DILocation(line: 116, column: 31, scope: !207)
!212 = !DILocation(line: 116, column: 13, scope: !178)
!213 = !DILocation(line: 118, column: 13, scope: !214)
!214 = distinct !DILexicalBlock(scope: !207, file: !15, line: 117, column: 9)
!215 = !DILocation(line: 118, column: 20, scope: !214)
!216 = !DILocation(line: 118, column: 26, scope: !214)
!217 = !DILocation(line: 120, column: 19, scope: !218)
!218 = distinct !DILexicalBlock(scope: !214, file: !15, line: 120, column: 13)
!219 = !DILocation(line: 120, column: 17, scope: !218)
!220 = !DILocation(line: 120, column: 24, scope: !221)
!221 = distinct !DILexicalBlock(scope: !218, file: !15, line: 120, column: 13)
!222 = !DILocation(line: 120, column: 26, scope: !221)
!223 = !DILocation(line: 120, column: 13, scope: !218)
!224 = !DILocation(line: 122, column: 30, scope: !225)
!225 = distinct !DILexicalBlock(scope: !221, file: !15, line: 121, column: 13)
!226 = !DILocation(line: 122, column: 37, scope: !225)
!227 = !DILocation(line: 122, column: 17, scope: !225)
!228 = !DILocation(line: 123, column: 13, scope: !225)
!229 = !DILocation(line: 120, column: 33, scope: !221)
!230 = !DILocation(line: 120, column: 13, scope: !221)
!231 = distinct !{!231, !223, !232, !52}
!232 = !DILocation(line: 123, column: 13, scope: !218)
!233 = !DILocation(line: 124, column: 9, scope: !214)
!234 = !DILocation(line: 127, column: 13, scope: !235)
!235 = distinct !DILexicalBlock(scope: !207, file: !15, line: 126, column: 9)
!236 = !DILocation(line: 129, column: 14, scope: !178)
!237 = !DILocation(line: 129, column: 9, scope: !178)
!238 = !DILocation(line: 131, column: 1, scope: !171)
