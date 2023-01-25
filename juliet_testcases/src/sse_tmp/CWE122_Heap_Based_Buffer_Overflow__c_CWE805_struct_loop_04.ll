; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_04.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_04_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !27
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !30
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !31
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !32
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !53
  %cmp1 = icmp ult i64 %2, 100, !dbg !55
  br i1 %cmp1, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !59
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !60
  store i32 0, i32* %intOne, align 8, !dbg !61
  %4 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !63
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !64
  store i32 0, i32* %intTwo, align 4, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %5, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !72, metadata !DIExpression()), !dbg !74
  store i64 0, i64* %i3, align 8, !dbg !75
  br label %for.cond4, !dbg !77

for.cond4:                                        ; preds = %for.inc9, %for.end
  %6 = load i64, i64* %i3, align 8, !dbg !78
  %cmp5 = icmp ult i64 %6, 100, !dbg !80
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !81

for.body6:                                        ; preds = %for.cond4
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !82
  %8 = load i64, i64* %i3, align 8, !dbg !84
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %8, !dbg !82
  %9 = load i64, i64* %i3, align 8, !dbg !85
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !86
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !86
  %11 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 8 %11, i64 8, i1 false), !dbg !86
  br label %for.inc9, !dbg !87

for.inc9:                                         ; preds = %for.body6
  %12 = load i64, i64* %i3, align 8, !dbg !88
  %inc10 = add i64 %12, 1, !dbg !88
  store i64 %inc10, i64* %i3, align 8, !dbg !88
  br label %for.cond4, !dbg !89, !llvm.loop !90

for.end11:                                        ; preds = %for.cond4
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !92
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !92
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !93
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !94
  %15 = bitcast %struct._twoIntsStruct* %14 to i8*, !dbg !94
  call void @free(i8* %15) #6, !dbg !95
  ret void, !dbg !96
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_04_good() #0 !dbg !97 {
entry:
  call void @goodG2B1(), !dbg !98
  call void @goodG2B2(), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !101 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !107, metadata !DIExpression()), !dbg !108
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !109, metadata !DIExpression()), !dbg !110
  %call = call i64 @time(i64* null) #6, !dbg !111
  %conv = trunc i64 %call to i32, !dbg !112
  call void @srand(i32 %conv) #6, !dbg !113
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !114
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_04_good(), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !116
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !117
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_04_bad(), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !119
  ret i32 0, !dbg !120
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !121 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !122, metadata !DIExpression()), !dbg !123
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !124
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !125
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !128
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !129
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !130
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !132
  br i1 %cmp, label %if.then, label %if.end, !dbg !133

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !134
  unreachable, !dbg !134

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !136, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata i64* %i, metadata !139, metadata !DIExpression()), !dbg !141
  store i64 0, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !144

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !145
  %cmp1 = icmp ult i64 %2, 100, !dbg !147
  br i1 %cmp1, label %for.body, label %for.end, !dbg !148

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !151
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !152
  store i32 0, i32* %intOne, align 8, !dbg !153
  %4 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !155
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !156
  store i32 0, i32* %intTwo, align 4, !dbg !157
  br label %for.inc, !dbg !158

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !159
  %inc = add i64 %5, 1, !dbg !159
  store i64 %inc, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !160, !llvm.loop !161

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !163, metadata !DIExpression()), !dbg !165
  store i64 0, i64* %i3, align 8, !dbg !166
  br label %for.cond4, !dbg !168

for.cond4:                                        ; preds = %for.inc9, %for.end
  %6 = load i64, i64* %i3, align 8, !dbg !169
  %cmp5 = icmp ult i64 %6, 100, !dbg !171
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !172

for.body6:                                        ; preds = %for.cond4
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !173
  %8 = load i64, i64* %i3, align 8, !dbg !175
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %8, !dbg !173
  %9 = load i64, i64* %i3, align 8, !dbg !176
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !177
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !177
  %11 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !177
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 8 %11, i64 8, i1 false), !dbg !177
  br label %for.inc9, !dbg !178

for.inc9:                                         ; preds = %for.body6
  %12 = load i64, i64* %i3, align 8, !dbg !179
  %inc10 = add i64 %12, 1, !dbg !179
  store i64 %inc10, i64* %i3, align 8, !dbg !179
  br label %for.cond4, !dbg !180, !llvm.loop !181

for.end11:                                        ; preds = %for.cond4
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !183
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !183
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !184
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !185
  %15 = bitcast %struct._twoIntsStruct* %14 to i8*, !dbg !185
  call void @free(i8* %15) #6, !dbg !186
  ret void, !dbg !187
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !188 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !189, metadata !DIExpression()), !dbg !190
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !191
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !192
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !195
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !196
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !197
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !199
  br i1 %cmp, label %if.then, label %if.end, !dbg !200

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !201
  unreachable, !dbg !201

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !203, metadata !DIExpression()), !dbg !205
  call void @llvm.dbg.declare(metadata i64* %i, metadata !206, metadata !DIExpression()), !dbg !208
  store i64 0, i64* %i, align 8, !dbg !209
  br label %for.cond, !dbg !211

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !212
  %cmp1 = icmp ult i64 %2, 100, !dbg !214
  br i1 %cmp1, label %for.body, label %for.end, !dbg !215

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !216
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !218
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !219
  store i32 0, i32* %intOne, align 8, !dbg !220
  %4 = load i64, i64* %i, align 8, !dbg !221
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !222
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !223
  store i32 0, i32* %intTwo, align 4, !dbg !224
  br label %for.inc, !dbg !225

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !226
  %inc = add i64 %5, 1, !dbg !226
  store i64 %inc, i64* %i, align 8, !dbg !226
  br label %for.cond, !dbg !227, !llvm.loop !228

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !230, metadata !DIExpression()), !dbg !232
  store i64 0, i64* %i3, align 8, !dbg !233
  br label %for.cond4, !dbg !235

for.cond4:                                        ; preds = %for.inc9, %for.end
  %6 = load i64, i64* %i3, align 8, !dbg !236
  %cmp5 = icmp ult i64 %6, 100, !dbg !238
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !239

for.body6:                                        ; preds = %for.cond4
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !240
  %8 = load i64, i64* %i3, align 8, !dbg !242
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %8, !dbg !240
  %9 = load i64, i64* %i3, align 8, !dbg !243
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !244
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !244
  %11 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !244
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 8 %11, i64 8, i1 false), !dbg !244
  br label %for.inc9, !dbg !245

for.inc9:                                         ; preds = %for.body6
  %12 = load i64, i64* %i3, align 8, !dbg !246
  %inc10 = add i64 %12, 1, !dbg !246
  store i64 %inc10, i64* %i3, align 8, !dbg !246
  br label %for.cond4, !dbg !247, !llvm.loop !248

for.end11:                                        ; preds = %for.cond4
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !250
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !250
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !251
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !252
  %15 = bitcast %struct._twoIntsStruct* %14 to i8*, !dbg !252
  call void @free(i8* %15) #6, !dbg !253
  ret void, !dbg !254
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_04.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12, !13}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_04_bad", scope: !21, file: !21, line: 28, type: !22, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_04.c", directory: "/home/joelyang/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 30, type: !4)
!25 = !DILocation(line: 30, column: 21, scope: !20)
!26 = !DILocation(line: 31, column: 10, scope: !20)
!27 = !DILocation(line: 35, column: 33, scope: !28)
!28 = distinct !DILexicalBlock(scope: !29, file: !21, line: 33, column: 5)
!29 = distinct !DILexicalBlock(scope: !20, file: !21, line: 32, column: 8)
!30 = !DILocation(line: 35, column: 16, scope: !28)
!31 = !DILocation(line: 35, column: 14, scope: !28)
!32 = !DILocation(line: 36, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !28, file: !21, line: 36, column: 13)
!34 = !DILocation(line: 36, column: 18, scope: !33)
!35 = !DILocation(line: 36, column: 13, scope: !28)
!36 = !DILocation(line: 36, column: 28, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !21, line: 36, column: 27)
!38 = !DILocalVariable(name: "source", scope: !39, file: !21, line: 39, type: !40)
!39 = distinct !DILexicalBlock(scope: !20, file: !21, line: 38, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 39, column: 23, scope: !39)
!44 = !DILocalVariable(name: "i", scope: !45, file: !21, line: 41, type: !46)
!45 = distinct !DILexicalBlock(scope: !39, file: !21, line: 40, column: 9)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 46, baseType: !48)
!47 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 41, column: 20, scope: !45)
!50 = !DILocation(line: 43, column: 20, scope: !51)
!51 = distinct !DILexicalBlock(scope: !45, file: !21, line: 43, column: 13)
!52 = !DILocation(line: 43, column: 18, scope: !51)
!53 = !DILocation(line: 43, column: 25, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !21, line: 43, column: 13)
!55 = !DILocation(line: 43, column: 27, scope: !54)
!56 = !DILocation(line: 43, column: 13, scope: !51)
!57 = !DILocation(line: 45, column: 24, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !21, line: 44, column: 13)
!59 = !DILocation(line: 45, column: 17, scope: !58)
!60 = !DILocation(line: 45, column: 27, scope: !58)
!61 = !DILocation(line: 45, column: 34, scope: !58)
!62 = !DILocation(line: 46, column: 24, scope: !58)
!63 = !DILocation(line: 46, column: 17, scope: !58)
!64 = !DILocation(line: 46, column: 27, scope: !58)
!65 = !DILocation(line: 46, column: 34, scope: !58)
!66 = !DILocation(line: 47, column: 13, scope: !58)
!67 = !DILocation(line: 43, column: 35, scope: !54)
!68 = !DILocation(line: 43, column: 13, scope: !54)
!69 = distinct !{!69, !56, !70, !71}
!70 = !DILocation(line: 47, column: 13, scope: !51)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocalVariable(name: "i", scope: !73, file: !21, line: 50, type: !46)
!73 = distinct !DILexicalBlock(scope: !39, file: !21, line: 49, column: 9)
!74 = !DILocation(line: 50, column: 20, scope: !73)
!75 = !DILocation(line: 52, column: 20, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !21, line: 52, column: 13)
!77 = !DILocation(line: 52, column: 18, scope: !76)
!78 = !DILocation(line: 52, column: 25, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !21, line: 52, column: 13)
!80 = !DILocation(line: 52, column: 27, scope: !79)
!81 = !DILocation(line: 52, column: 13, scope: !76)
!82 = !DILocation(line: 54, column: 17, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !21, line: 53, column: 13)
!84 = !DILocation(line: 54, column: 22, scope: !83)
!85 = !DILocation(line: 54, column: 34, scope: !83)
!86 = !DILocation(line: 54, column: 27, scope: !83)
!87 = !DILocation(line: 55, column: 13, scope: !83)
!88 = !DILocation(line: 52, column: 35, scope: !79)
!89 = !DILocation(line: 52, column: 13, scope: !79)
!90 = distinct !{!90, !81, !91, !71}
!91 = !DILocation(line: 55, column: 13, scope: !76)
!92 = !DILocation(line: 56, column: 30, scope: !73)
!93 = !DILocation(line: 56, column: 13, scope: !73)
!94 = !DILocation(line: 57, column: 18, scope: !73)
!95 = !DILocation(line: 57, column: 13, scope: !73)
!96 = !DILocation(line: 60, column: 1, scope: !20)
!97 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_04_good", scope: !21, file: !21, line: 141, type: !22, scopeLine: 142, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocation(line: 143, column: 5, scope: !97)
!99 = !DILocation(line: 144, column: 5, scope: !97)
!100 = !DILocation(line: 145, column: 1, scope: !97)
!101 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 157, type: !102, scopeLine: 158, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DISubroutineType(types: !103)
!103 = !{!10, !10, !104}
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!107 = !DILocalVariable(name: "argc", arg: 1, scope: !101, file: !21, line: 157, type: !10)
!108 = !DILocation(line: 157, column: 14, scope: !101)
!109 = !DILocalVariable(name: "argv", arg: 2, scope: !101, file: !21, line: 157, type: !104)
!110 = !DILocation(line: 157, column: 27, scope: !101)
!111 = !DILocation(line: 160, column: 22, scope: !101)
!112 = !DILocation(line: 160, column: 12, scope: !101)
!113 = !DILocation(line: 160, column: 5, scope: !101)
!114 = !DILocation(line: 162, column: 5, scope: !101)
!115 = !DILocation(line: 163, column: 5, scope: !101)
!116 = !DILocation(line: 164, column: 5, scope: !101)
!117 = !DILocation(line: 167, column: 5, scope: !101)
!118 = !DILocation(line: 168, column: 5, scope: !101)
!119 = !DILocation(line: 169, column: 5, scope: !101)
!120 = !DILocation(line: 171, column: 5, scope: !101)
!121 = distinct !DISubprogram(name: "goodG2B1", scope: !21, file: !21, line: 67, type: !22, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!122 = !DILocalVariable(name: "data", scope: !121, file: !21, line: 69, type: !4)
!123 = !DILocation(line: 69, column: 21, scope: !121)
!124 = !DILocation(line: 70, column: 10, scope: !121)
!125 = !DILocation(line: 79, column: 33, scope: !126)
!126 = distinct !DILexicalBlock(scope: !127, file: !21, line: 77, column: 5)
!127 = distinct !DILexicalBlock(scope: !121, file: !21, line: 71, column: 8)
!128 = !DILocation(line: 79, column: 16, scope: !126)
!129 = !DILocation(line: 79, column: 14, scope: !126)
!130 = !DILocation(line: 80, column: 13, scope: !131)
!131 = distinct !DILexicalBlock(scope: !126, file: !21, line: 80, column: 13)
!132 = !DILocation(line: 80, column: 18, scope: !131)
!133 = !DILocation(line: 80, column: 13, scope: !126)
!134 = !DILocation(line: 80, column: 28, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !21, line: 80, column: 27)
!136 = !DILocalVariable(name: "source", scope: !137, file: !21, line: 83, type: !40)
!137 = distinct !DILexicalBlock(scope: !121, file: !21, line: 82, column: 5)
!138 = !DILocation(line: 83, column: 23, scope: !137)
!139 = !DILocalVariable(name: "i", scope: !140, file: !21, line: 85, type: !46)
!140 = distinct !DILexicalBlock(scope: !137, file: !21, line: 84, column: 9)
!141 = !DILocation(line: 85, column: 20, scope: !140)
!142 = !DILocation(line: 87, column: 20, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !21, line: 87, column: 13)
!144 = !DILocation(line: 87, column: 18, scope: !143)
!145 = !DILocation(line: 87, column: 25, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !21, line: 87, column: 13)
!147 = !DILocation(line: 87, column: 27, scope: !146)
!148 = !DILocation(line: 87, column: 13, scope: !143)
!149 = !DILocation(line: 89, column: 24, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !21, line: 88, column: 13)
!151 = !DILocation(line: 89, column: 17, scope: !150)
!152 = !DILocation(line: 89, column: 27, scope: !150)
!153 = !DILocation(line: 89, column: 34, scope: !150)
!154 = !DILocation(line: 90, column: 24, scope: !150)
!155 = !DILocation(line: 90, column: 17, scope: !150)
!156 = !DILocation(line: 90, column: 27, scope: !150)
!157 = !DILocation(line: 90, column: 34, scope: !150)
!158 = !DILocation(line: 91, column: 13, scope: !150)
!159 = !DILocation(line: 87, column: 35, scope: !146)
!160 = !DILocation(line: 87, column: 13, scope: !146)
!161 = distinct !{!161, !148, !162, !71}
!162 = !DILocation(line: 91, column: 13, scope: !143)
!163 = !DILocalVariable(name: "i", scope: !164, file: !21, line: 94, type: !46)
!164 = distinct !DILexicalBlock(scope: !137, file: !21, line: 93, column: 9)
!165 = !DILocation(line: 94, column: 20, scope: !164)
!166 = !DILocation(line: 96, column: 20, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !21, line: 96, column: 13)
!168 = !DILocation(line: 96, column: 18, scope: !167)
!169 = !DILocation(line: 96, column: 25, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !21, line: 96, column: 13)
!171 = !DILocation(line: 96, column: 27, scope: !170)
!172 = !DILocation(line: 96, column: 13, scope: !167)
!173 = !DILocation(line: 98, column: 17, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !21, line: 97, column: 13)
!175 = !DILocation(line: 98, column: 22, scope: !174)
!176 = !DILocation(line: 98, column: 34, scope: !174)
!177 = !DILocation(line: 98, column: 27, scope: !174)
!178 = !DILocation(line: 99, column: 13, scope: !174)
!179 = !DILocation(line: 96, column: 35, scope: !170)
!180 = !DILocation(line: 96, column: 13, scope: !170)
!181 = distinct !{!181, !172, !182, !71}
!182 = !DILocation(line: 99, column: 13, scope: !167)
!183 = !DILocation(line: 100, column: 30, scope: !164)
!184 = !DILocation(line: 100, column: 13, scope: !164)
!185 = !DILocation(line: 101, column: 18, scope: !164)
!186 = !DILocation(line: 101, column: 13, scope: !164)
!187 = !DILocation(line: 104, column: 1, scope: !121)
!188 = distinct !DISubprogram(name: "goodG2B2", scope: !21, file: !21, line: 107, type: !22, scopeLine: 108, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!189 = !DILocalVariable(name: "data", scope: !188, file: !21, line: 109, type: !4)
!190 = !DILocation(line: 109, column: 21, scope: !188)
!191 = !DILocation(line: 110, column: 10, scope: !188)
!192 = !DILocation(line: 114, column: 33, scope: !193)
!193 = distinct !DILexicalBlock(scope: !194, file: !21, line: 112, column: 5)
!194 = distinct !DILexicalBlock(scope: !188, file: !21, line: 111, column: 8)
!195 = !DILocation(line: 114, column: 16, scope: !193)
!196 = !DILocation(line: 114, column: 14, scope: !193)
!197 = !DILocation(line: 115, column: 13, scope: !198)
!198 = distinct !DILexicalBlock(scope: !193, file: !21, line: 115, column: 13)
!199 = !DILocation(line: 115, column: 18, scope: !198)
!200 = !DILocation(line: 115, column: 13, scope: !193)
!201 = !DILocation(line: 115, column: 28, scope: !202)
!202 = distinct !DILexicalBlock(scope: !198, file: !21, line: 115, column: 27)
!203 = !DILocalVariable(name: "source", scope: !204, file: !21, line: 118, type: !40)
!204 = distinct !DILexicalBlock(scope: !188, file: !21, line: 117, column: 5)
!205 = !DILocation(line: 118, column: 23, scope: !204)
!206 = !DILocalVariable(name: "i", scope: !207, file: !21, line: 120, type: !46)
!207 = distinct !DILexicalBlock(scope: !204, file: !21, line: 119, column: 9)
!208 = !DILocation(line: 120, column: 20, scope: !207)
!209 = !DILocation(line: 122, column: 20, scope: !210)
!210 = distinct !DILexicalBlock(scope: !207, file: !21, line: 122, column: 13)
!211 = !DILocation(line: 122, column: 18, scope: !210)
!212 = !DILocation(line: 122, column: 25, scope: !213)
!213 = distinct !DILexicalBlock(scope: !210, file: !21, line: 122, column: 13)
!214 = !DILocation(line: 122, column: 27, scope: !213)
!215 = !DILocation(line: 122, column: 13, scope: !210)
!216 = !DILocation(line: 124, column: 24, scope: !217)
!217 = distinct !DILexicalBlock(scope: !213, file: !21, line: 123, column: 13)
!218 = !DILocation(line: 124, column: 17, scope: !217)
!219 = !DILocation(line: 124, column: 27, scope: !217)
!220 = !DILocation(line: 124, column: 34, scope: !217)
!221 = !DILocation(line: 125, column: 24, scope: !217)
!222 = !DILocation(line: 125, column: 17, scope: !217)
!223 = !DILocation(line: 125, column: 27, scope: !217)
!224 = !DILocation(line: 125, column: 34, scope: !217)
!225 = !DILocation(line: 126, column: 13, scope: !217)
!226 = !DILocation(line: 122, column: 35, scope: !213)
!227 = !DILocation(line: 122, column: 13, scope: !213)
!228 = distinct !{!228, !215, !229, !71}
!229 = !DILocation(line: 126, column: 13, scope: !210)
!230 = !DILocalVariable(name: "i", scope: !231, file: !21, line: 129, type: !46)
!231 = distinct !DILexicalBlock(scope: !204, file: !21, line: 128, column: 9)
!232 = !DILocation(line: 129, column: 20, scope: !231)
!233 = !DILocation(line: 131, column: 20, scope: !234)
!234 = distinct !DILexicalBlock(scope: !231, file: !21, line: 131, column: 13)
!235 = !DILocation(line: 131, column: 18, scope: !234)
!236 = !DILocation(line: 131, column: 25, scope: !237)
!237 = distinct !DILexicalBlock(scope: !234, file: !21, line: 131, column: 13)
!238 = !DILocation(line: 131, column: 27, scope: !237)
!239 = !DILocation(line: 131, column: 13, scope: !234)
!240 = !DILocation(line: 133, column: 17, scope: !241)
!241 = distinct !DILexicalBlock(scope: !237, file: !21, line: 132, column: 13)
!242 = !DILocation(line: 133, column: 22, scope: !241)
!243 = !DILocation(line: 133, column: 34, scope: !241)
!244 = !DILocation(line: 133, column: 27, scope: !241)
!245 = !DILocation(line: 134, column: 13, scope: !241)
!246 = !DILocation(line: 131, column: 35, scope: !237)
!247 = !DILocation(line: 131, column: 13, scope: !237)
!248 = distinct !{!248, !239, !249, !71}
!249 = !DILocation(line: 134, column: 13, scope: !234)
!250 = !DILocation(line: 135, column: 30, scope: !231)
!251 = !DILocation(line: 135, column: 13, scope: !231)
!252 = !DILocation(line: 136, column: 18, scope: !231)
!253 = !DILocation(line: 136, column: 13, scope: !231)
!254 = !DILocation(line: 139, column: 1, scope: !188)
