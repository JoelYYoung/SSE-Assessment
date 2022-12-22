; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_15_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !27
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !28
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !29
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !30
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !36, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !51
  %cmp1 = icmp ult i64 %2, 100, !dbg !53
  br i1 %cmp1, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !57
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !58
  store i32 0, i32* %intOne, align 8, !dbg !59
  %4 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !61
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !62
  store i32 0, i32* %intTwo, align 4, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %5, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !70, metadata !DIExpression()), !dbg !72
  store i64 0, i64* %i3, align 8, !dbg !73
  br label %for.cond4, !dbg !75

for.cond4:                                        ; preds = %for.inc9, %for.end
  %6 = load i64, i64* %i3, align 8, !dbg !76
  %cmp5 = icmp ult i64 %6, 100, !dbg !78
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !79

for.body6:                                        ; preds = %for.cond4
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !80
  %8 = load i64, i64* %i3, align 8, !dbg !82
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %8, !dbg !80
  %9 = load i64, i64* %i3, align 8, !dbg !83
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !84
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !84
  %11 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !84
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 8 %11, i64 8, i1 false), !dbg !84
  br label %for.inc9, !dbg !85

for.inc9:                                         ; preds = %for.body6
  %12 = load i64, i64* %i3, align 8, !dbg !86
  %inc10 = add i64 %12, 1, !dbg !86
  store i64 %inc10, i64* %i3, align 8, !dbg !86
  br label %for.cond4, !dbg !87, !llvm.loop !88

for.end11:                                        ; preds = %for.cond4
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !90
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !90
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !91
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !92
  %15 = bitcast %struct._twoIntsStruct* %14 to i8*, !dbg !92
  call void @free(i8* %15) #6, !dbg !93
  ret void, !dbg !94
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_15_good() #0 !dbg !95 {
entry:
  call void @goodG2B1(), !dbg !96
  call void @goodG2B2(), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !99 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !105, metadata !DIExpression()), !dbg !106
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !107, metadata !DIExpression()), !dbg !108
  %call = call i64 @time(i64* null) #6, !dbg !109
  %conv = trunc i64 %call to i32, !dbg !110
  call void @srand(i32 %conv) #6, !dbg !111
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !112
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_15_good(), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !115
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_15_bad(), !dbg !116
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !117
  ret i32 0, !dbg !118
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !119 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !120, metadata !DIExpression()), !dbg !121
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !122
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !123
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !124
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !125
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !126
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !128
  br i1 %cmp, label %if.then, label %if.end, !dbg !129

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !130
  unreachable, !dbg !130

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !132, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata i64* %i, metadata !135, metadata !DIExpression()), !dbg !137
  store i64 0, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !141
  %cmp1 = icmp ult i64 %2, 100, !dbg !143
  br i1 %cmp1, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !147
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !148
  store i32 0, i32* %intOne, align 8, !dbg !149
  %4 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !151
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !152
  store i32 0, i32* %intTwo, align 4, !dbg !153
  br label %for.inc, !dbg !154

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !155
  %inc = add i64 %5, 1, !dbg !155
  store i64 %inc, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !156, !llvm.loop !157

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !159, metadata !DIExpression()), !dbg !161
  store i64 0, i64* %i3, align 8, !dbg !162
  br label %for.cond4, !dbg !164

for.cond4:                                        ; preds = %for.inc9, %for.end
  %6 = load i64, i64* %i3, align 8, !dbg !165
  %cmp5 = icmp ult i64 %6, 100, !dbg !167
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !168

for.body6:                                        ; preds = %for.cond4
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !169
  %8 = load i64, i64* %i3, align 8, !dbg !171
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %8, !dbg !169
  %9 = load i64, i64* %i3, align 8, !dbg !172
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !173
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !173
  %11 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !173
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 8 %11, i64 8, i1 false), !dbg !173
  br label %for.inc9, !dbg !174

for.inc9:                                         ; preds = %for.body6
  %12 = load i64, i64* %i3, align 8, !dbg !175
  %inc10 = add i64 %12, 1, !dbg !175
  store i64 %inc10, i64* %i3, align 8, !dbg !175
  br label %for.cond4, !dbg !176, !llvm.loop !177

for.end11:                                        ; preds = %for.cond4
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !179
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !179
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !180
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !181
  %15 = bitcast %struct._twoIntsStruct* %14 to i8*, !dbg !181
  call void @free(i8* %15) #6, !dbg !182
  ret void, !dbg !183
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !184 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !185, metadata !DIExpression()), !dbg !186
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !187
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !188
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !189
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !190
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !191
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !193
  br i1 %cmp, label %if.then, label %if.end, !dbg !194

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !195
  unreachable, !dbg !195

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !197, metadata !DIExpression()), !dbg !199
  call void @llvm.dbg.declare(metadata i64* %i, metadata !200, metadata !DIExpression()), !dbg !202
  store i64 0, i64* %i, align 8, !dbg !203
  br label %for.cond, !dbg !205

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !206
  %cmp1 = icmp ult i64 %2, 100, !dbg !208
  br i1 %cmp1, label %for.body, label %for.end, !dbg !209

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !210
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !212
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !213
  store i32 0, i32* %intOne, align 8, !dbg !214
  %4 = load i64, i64* %i, align 8, !dbg !215
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !216
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !217
  store i32 0, i32* %intTwo, align 4, !dbg !218
  br label %for.inc, !dbg !219

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !220
  %inc = add i64 %5, 1, !dbg !220
  store i64 %inc, i64* %i, align 8, !dbg !220
  br label %for.cond, !dbg !221, !llvm.loop !222

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !224, metadata !DIExpression()), !dbg !226
  store i64 0, i64* %i3, align 8, !dbg !227
  br label %for.cond4, !dbg !229

for.cond4:                                        ; preds = %for.inc9, %for.end
  %6 = load i64, i64* %i3, align 8, !dbg !230
  %cmp5 = icmp ult i64 %6, 100, !dbg !232
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !233

for.body6:                                        ; preds = %for.cond4
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !234
  %8 = load i64, i64* %i3, align 8, !dbg !236
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %8, !dbg !234
  %9 = load i64, i64* %i3, align 8, !dbg !237
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !238
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !238
  %11 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !238
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 8 %11, i64 8, i1 false), !dbg !238
  br label %for.inc9, !dbg !239

for.inc9:                                         ; preds = %for.body6
  %12 = load i64, i64* %i3, align 8, !dbg !240
  %inc10 = add i64 %12, 1, !dbg !240
  store i64 %inc10, i64* %i3, align 8, !dbg !240
  br label %for.cond4, !dbg !241, !llvm.loop !242

for.end11:                                        ; preds = %for.cond4
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !244
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !244
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !245
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !246
  %15 = bitcast %struct._twoIntsStruct* %14 to i8*, !dbg !246
  call void @free(i8* %15) #6, !dbg !247
  ret void, !dbg !248
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_15.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12, !13}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !6, line: 96, size: 64, elements: !8)
!8 = !{!9, !11}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !7, file: !6, line: 98, baseType: !10, size: 32)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !7, file: !6, line: 99, baseType: !10, size: 32, offset: 32)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!13 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_15_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_15.c", directory: "/root/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 23, type: !4)
!25 = !DILocation(line: 23, column: 21, scope: !20)
!26 = !DILocation(line: 24, column: 10, scope: !20)
!27 = !DILocation(line: 29, column: 33, scope: !20)
!28 = !DILocation(line: 29, column: 16, scope: !20)
!29 = !DILocation(line: 29, column: 14, scope: !20)
!30 = !DILocation(line: 30, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !20, file: !21, line: 30, column: 13)
!32 = !DILocation(line: 30, column: 18, scope: !31)
!33 = !DILocation(line: 30, column: 13, scope: !20)
!34 = !DILocation(line: 30, column: 28, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !21, line: 30, column: 27)
!36 = !DILocalVariable(name: "source", scope: !37, file: !21, line: 38, type: !38)
!37 = distinct !DILexicalBlock(scope: !20, file: !21, line: 37, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 38, column: 23, scope: !37)
!42 = !DILocalVariable(name: "i", scope: !43, file: !21, line: 40, type: !44)
!43 = distinct !DILexicalBlock(scope: !37, file: !21, line: 39, column: 9)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 46, baseType: !46)
!45 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 40, column: 20, scope: !43)
!48 = !DILocation(line: 42, column: 20, scope: !49)
!49 = distinct !DILexicalBlock(scope: !43, file: !21, line: 42, column: 13)
!50 = !DILocation(line: 42, column: 18, scope: !49)
!51 = !DILocation(line: 42, column: 25, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !21, line: 42, column: 13)
!53 = !DILocation(line: 42, column: 27, scope: !52)
!54 = !DILocation(line: 42, column: 13, scope: !49)
!55 = !DILocation(line: 44, column: 24, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !21, line: 43, column: 13)
!57 = !DILocation(line: 44, column: 17, scope: !56)
!58 = !DILocation(line: 44, column: 27, scope: !56)
!59 = !DILocation(line: 44, column: 34, scope: !56)
!60 = !DILocation(line: 45, column: 24, scope: !56)
!61 = !DILocation(line: 45, column: 17, scope: !56)
!62 = !DILocation(line: 45, column: 27, scope: !56)
!63 = !DILocation(line: 45, column: 34, scope: !56)
!64 = !DILocation(line: 46, column: 13, scope: !56)
!65 = !DILocation(line: 42, column: 35, scope: !52)
!66 = !DILocation(line: 42, column: 13, scope: !52)
!67 = distinct !{!67, !54, !68, !69}
!68 = !DILocation(line: 46, column: 13, scope: !49)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocalVariable(name: "i", scope: !71, file: !21, line: 49, type: !44)
!71 = distinct !DILexicalBlock(scope: !37, file: !21, line: 48, column: 9)
!72 = !DILocation(line: 49, column: 20, scope: !71)
!73 = !DILocation(line: 51, column: 20, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !21, line: 51, column: 13)
!75 = !DILocation(line: 51, column: 18, scope: !74)
!76 = !DILocation(line: 51, column: 25, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !21, line: 51, column: 13)
!78 = !DILocation(line: 51, column: 27, scope: !77)
!79 = !DILocation(line: 51, column: 13, scope: !74)
!80 = !DILocation(line: 53, column: 17, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !21, line: 52, column: 13)
!82 = !DILocation(line: 53, column: 22, scope: !81)
!83 = !DILocation(line: 53, column: 34, scope: !81)
!84 = !DILocation(line: 53, column: 27, scope: !81)
!85 = !DILocation(line: 54, column: 13, scope: !81)
!86 = !DILocation(line: 51, column: 35, scope: !77)
!87 = !DILocation(line: 51, column: 13, scope: !77)
!88 = distinct !{!88, !79, !89, !69}
!89 = !DILocation(line: 54, column: 13, scope: !74)
!90 = !DILocation(line: 55, column: 30, scope: !71)
!91 = !DILocation(line: 55, column: 13, scope: !71)
!92 = !DILocation(line: 56, column: 18, scope: !71)
!93 = !DILocation(line: 56, column: 13, scope: !71)
!94 = !DILocation(line: 59, column: 1, scope: !20)
!95 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_15_good", scope: !21, file: !21, line: 147, type: !22, scopeLine: 148, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocation(line: 149, column: 5, scope: !95)
!97 = !DILocation(line: 150, column: 5, scope: !95)
!98 = !DILocation(line: 151, column: 1, scope: !95)
!99 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 163, type: !100, scopeLine: 164, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DISubroutineType(types: !101)
!101 = !{!10, !10, !102}
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!105 = !DILocalVariable(name: "argc", arg: 1, scope: !99, file: !21, line: 163, type: !10)
!106 = !DILocation(line: 163, column: 14, scope: !99)
!107 = !DILocalVariable(name: "argv", arg: 2, scope: !99, file: !21, line: 163, type: !102)
!108 = !DILocation(line: 163, column: 27, scope: !99)
!109 = !DILocation(line: 166, column: 22, scope: !99)
!110 = !DILocation(line: 166, column: 12, scope: !99)
!111 = !DILocation(line: 166, column: 5, scope: !99)
!112 = !DILocation(line: 168, column: 5, scope: !99)
!113 = !DILocation(line: 169, column: 5, scope: !99)
!114 = !DILocation(line: 170, column: 5, scope: !99)
!115 = !DILocation(line: 173, column: 5, scope: !99)
!116 = !DILocation(line: 174, column: 5, scope: !99)
!117 = !DILocation(line: 175, column: 5, scope: !99)
!118 = !DILocation(line: 177, column: 5, scope: !99)
!119 = distinct !DISubprogram(name: "goodG2B1", scope: !21, file: !21, line: 66, type: !22, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!120 = !DILocalVariable(name: "data", scope: !119, file: !21, line: 68, type: !4)
!121 = !DILocation(line: 68, column: 21, scope: !119)
!122 = !DILocation(line: 69, column: 10, scope: !119)
!123 = !DILocation(line: 78, column: 33, scope: !119)
!124 = !DILocation(line: 78, column: 16, scope: !119)
!125 = !DILocation(line: 78, column: 14, scope: !119)
!126 = !DILocation(line: 79, column: 13, scope: !127)
!127 = distinct !DILexicalBlock(scope: !119, file: !21, line: 79, column: 13)
!128 = !DILocation(line: 79, column: 18, scope: !127)
!129 = !DILocation(line: 79, column: 13, scope: !119)
!130 = !DILocation(line: 79, column: 28, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !21, line: 79, column: 27)
!132 = !DILocalVariable(name: "source", scope: !133, file: !21, line: 83, type: !38)
!133 = distinct !DILexicalBlock(scope: !119, file: !21, line: 82, column: 5)
!134 = !DILocation(line: 83, column: 23, scope: !133)
!135 = !DILocalVariable(name: "i", scope: !136, file: !21, line: 85, type: !44)
!136 = distinct !DILexicalBlock(scope: !133, file: !21, line: 84, column: 9)
!137 = !DILocation(line: 85, column: 20, scope: !136)
!138 = !DILocation(line: 87, column: 20, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !21, line: 87, column: 13)
!140 = !DILocation(line: 87, column: 18, scope: !139)
!141 = !DILocation(line: 87, column: 25, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !21, line: 87, column: 13)
!143 = !DILocation(line: 87, column: 27, scope: !142)
!144 = !DILocation(line: 87, column: 13, scope: !139)
!145 = !DILocation(line: 89, column: 24, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !21, line: 88, column: 13)
!147 = !DILocation(line: 89, column: 17, scope: !146)
!148 = !DILocation(line: 89, column: 27, scope: !146)
!149 = !DILocation(line: 89, column: 34, scope: !146)
!150 = !DILocation(line: 90, column: 24, scope: !146)
!151 = !DILocation(line: 90, column: 17, scope: !146)
!152 = !DILocation(line: 90, column: 27, scope: !146)
!153 = !DILocation(line: 90, column: 34, scope: !146)
!154 = !DILocation(line: 91, column: 13, scope: !146)
!155 = !DILocation(line: 87, column: 35, scope: !142)
!156 = !DILocation(line: 87, column: 13, scope: !142)
!157 = distinct !{!157, !144, !158, !69}
!158 = !DILocation(line: 91, column: 13, scope: !139)
!159 = !DILocalVariable(name: "i", scope: !160, file: !21, line: 94, type: !44)
!160 = distinct !DILexicalBlock(scope: !133, file: !21, line: 93, column: 9)
!161 = !DILocation(line: 94, column: 20, scope: !160)
!162 = !DILocation(line: 96, column: 20, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !21, line: 96, column: 13)
!164 = !DILocation(line: 96, column: 18, scope: !163)
!165 = !DILocation(line: 96, column: 25, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !21, line: 96, column: 13)
!167 = !DILocation(line: 96, column: 27, scope: !166)
!168 = !DILocation(line: 96, column: 13, scope: !163)
!169 = !DILocation(line: 98, column: 17, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !21, line: 97, column: 13)
!171 = !DILocation(line: 98, column: 22, scope: !170)
!172 = !DILocation(line: 98, column: 34, scope: !170)
!173 = !DILocation(line: 98, column: 27, scope: !170)
!174 = !DILocation(line: 99, column: 13, scope: !170)
!175 = !DILocation(line: 96, column: 35, scope: !166)
!176 = !DILocation(line: 96, column: 13, scope: !166)
!177 = distinct !{!177, !168, !178, !69}
!178 = !DILocation(line: 99, column: 13, scope: !163)
!179 = !DILocation(line: 100, column: 30, scope: !160)
!180 = !DILocation(line: 100, column: 13, scope: !160)
!181 = !DILocation(line: 101, column: 18, scope: !160)
!182 = !DILocation(line: 101, column: 13, scope: !160)
!183 = !DILocation(line: 104, column: 1, scope: !119)
!184 = distinct !DISubprogram(name: "goodG2B2", scope: !21, file: !21, line: 107, type: !22, scopeLine: 108, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!185 = !DILocalVariable(name: "data", scope: !184, file: !21, line: 109, type: !4)
!186 = !DILocation(line: 109, column: 21, scope: !184)
!187 = !DILocation(line: 110, column: 10, scope: !184)
!188 = !DILocation(line: 115, column: 33, scope: !184)
!189 = !DILocation(line: 115, column: 16, scope: !184)
!190 = !DILocation(line: 115, column: 14, scope: !184)
!191 = !DILocation(line: 116, column: 13, scope: !192)
!192 = distinct !DILexicalBlock(scope: !184, file: !21, line: 116, column: 13)
!193 = !DILocation(line: 116, column: 18, scope: !192)
!194 = !DILocation(line: 116, column: 13, scope: !184)
!195 = !DILocation(line: 116, column: 28, scope: !196)
!196 = distinct !DILexicalBlock(scope: !192, file: !21, line: 116, column: 27)
!197 = !DILocalVariable(name: "source", scope: !198, file: !21, line: 124, type: !38)
!198 = distinct !DILexicalBlock(scope: !184, file: !21, line: 123, column: 5)
!199 = !DILocation(line: 124, column: 23, scope: !198)
!200 = !DILocalVariable(name: "i", scope: !201, file: !21, line: 126, type: !44)
!201 = distinct !DILexicalBlock(scope: !198, file: !21, line: 125, column: 9)
!202 = !DILocation(line: 126, column: 20, scope: !201)
!203 = !DILocation(line: 128, column: 20, scope: !204)
!204 = distinct !DILexicalBlock(scope: !201, file: !21, line: 128, column: 13)
!205 = !DILocation(line: 128, column: 18, scope: !204)
!206 = !DILocation(line: 128, column: 25, scope: !207)
!207 = distinct !DILexicalBlock(scope: !204, file: !21, line: 128, column: 13)
!208 = !DILocation(line: 128, column: 27, scope: !207)
!209 = !DILocation(line: 128, column: 13, scope: !204)
!210 = !DILocation(line: 130, column: 24, scope: !211)
!211 = distinct !DILexicalBlock(scope: !207, file: !21, line: 129, column: 13)
!212 = !DILocation(line: 130, column: 17, scope: !211)
!213 = !DILocation(line: 130, column: 27, scope: !211)
!214 = !DILocation(line: 130, column: 34, scope: !211)
!215 = !DILocation(line: 131, column: 24, scope: !211)
!216 = !DILocation(line: 131, column: 17, scope: !211)
!217 = !DILocation(line: 131, column: 27, scope: !211)
!218 = !DILocation(line: 131, column: 34, scope: !211)
!219 = !DILocation(line: 132, column: 13, scope: !211)
!220 = !DILocation(line: 128, column: 35, scope: !207)
!221 = !DILocation(line: 128, column: 13, scope: !207)
!222 = distinct !{!222, !209, !223, !69}
!223 = !DILocation(line: 132, column: 13, scope: !204)
!224 = !DILocalVariable(name: "i", scope: !225, file: !21, line: 135, type: !44)
!225 = distinct !DILexicalBlock(scope: !198, file: !21, line: 134, column: 9)
!226 = !DILocation(line: 135, column: 20, scope: !225)
!227 = !DILocation(line: 137, column: 20, scope: !228)
!228 = distinct !DILexicalBlock(scope: !225, file: !21, line: 137, column: 13)
!229 = !DILocation(line: 137, column: 18, scope: !228)
!230 = !DILocation(line: 137, column: 25, scope: !231)
!231 = distinct !DILexicalBlock(scope: !228, file: !21, line: 137, column: 13)
!232 = !DILocation(line: 137, column: 27, scope: !231)
!233 = !DILocation(line: 137, column: 13, scope: !228)
!234 = !DILocation(line: 139, column: 17, scope: !235)
!235 = distinct !DILexicalBlock(scope: !231, file: !21, line: 138, column: 13)
!236 = !DILocation(line: 139, column: 22, scope: !235)
!237 = !DILocation(line: 139, column: 34, scope: !235)
!238 = !DILocation(line: 139, column: 27, scope: !235)
!239 = !DILocation(line: 140, column: 13, scope: !235)
!240 = !DILocation(line: 137, column: 35, scope: !231)
!241 = !DILocation(line: 137, column: 13, scope: !231)
!242 = distinct !{!242, !233, !243, !69}
!243 = !DILocation(line: 140, column: 13, scope: !228)
!244 = !DILocation(line: 141, column: 30, scope: !225)
!245 = !DILocation(line: 141, column: 13, scope: !225)
!246 = !DILocation(line: 142, column: 18, scope: !225)
!247 = !DILocation(line: 142, column: 13, scope: !225)
!248 = !DILocation(line: 145, column: 1, scope: !184)
