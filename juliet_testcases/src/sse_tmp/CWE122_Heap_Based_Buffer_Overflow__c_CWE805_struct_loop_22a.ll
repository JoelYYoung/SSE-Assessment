; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_22a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_22_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !23, metadata !DIExpression()), !dbg !31
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !32
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_22_badGlobal, align 4, !dbg !33
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !34
  %call = call %struct._twoIntsStruct* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_22_badSource(%struct._twoIntsStruct* %0), !dbg !35
  store %struct._twoIntsStruct* %call, %struct._twoIntsStruct** %data, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !52
  %cmp = icmp ult i64 %1, 100, !dbg !54
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !58
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !59
  store i32 0, i32* %intOne, align 8, !dbg !60
  %3 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !62
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !63
  store i32 0, i32* %intTwo, align 4, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %4, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !71, metadata !DIExpression()), !dbg !73
  store i64 0, i64* %i2, align 8, !dbg !74
  br label %for.cond3, !dbg !76

for.cond3:                                        ; preds = %for.inc8, %for.end
  %5 = load i64, i64* %i2, align 8, !dbg !77
  %cmp4 = icmp ult i64 %5, 100, !dbg !79
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !80

for.body5:                                        ; preds = %for.cond3
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !81
  %7 = load i64, i64* %i2, align 8, !dbg !83
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !81
  %8 = load i64, i64* %i2, align 8, !dbg !84
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !85
  %9 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !85
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !85
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !85
  br label %for.inc8, !dbg !86

for.inc8:                                         ; preds = %for.body5
  %11 = load i64, i64* %i2, align 8, !dbg !87
  %inc9 = add i64 %11, 1, !dbg !87
  store i64 %inc9, i64* %i2, align 8, !dbg !87
  br label %for.cond3, !dbg !88, !llvm.loop !89

for.end10:                                        ; preds = %for.cond3
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !91
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !91
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !92
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !93
  %14 = bitcast %struct._twoIntsStruct* %13 to i8*, !dbg !93
  call void @free(i8* %14) #5, !dbg !94
  ret void, !dbg !95
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local %struct._twoIntsStruct* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_22_badSource(%struct._twoIntsStruct*) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_22_good() #0 !dbg !96 {
entry:
  call void @goodG2B1(), !dbg !97
  call void @goodG2B2(), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !100 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !106, metadata !DIExpression()), !dbg !107
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !108, metadata !DIExpression()), !dbg !109
  %call = call i64 @time(i64* null) #5, !dbg !110
  %conv = trunc i64 %call to i32, !dbg !111
  call void @srand(i32 %conv) #5, !dbg !112
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !113
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_22_good(), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !116
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_22_bad(), !dbg !117
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !118
  ret i32 0, !dbg !119
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !120 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !121, metadata !DIExpression()), !dbg !122
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !123
  store i32 0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_22_goodG2B1Global, align 4, !dbg !124
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !125
  %call = call %struct._twoIntsStruct* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_22_goodG2B1Source(%struct._twoIntsStruct* %0), !dbg !126
  store %struct._twoIntsStruct* %call, %struct._twoIntsStruct** %data, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !128, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %i, metadata !131, metadata !DIExpression()), !dbg !133
  store i64 0, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !137
  %cmp = icmp ult i64 %1, 100, !dbg !139
  br i1 %cmp, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !143
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !144
  store i32 0, i32* %intOne, align 8, !dbg !145
  %3 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !147
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !148
  store i32 0, i32* %intTwo, align 4, !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !151
  %inc = add i64 %4, 1, !dbg !151
  store i64 %inc, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !155, metadata !DIExpression()), !dbg !157
  store i64 0, i64* %i2, align 8, !dbg !158
  br label %for.cond3, !dbg !160

for.cond3:                                        ; preds = %for.inc8, %for.end
  %5 = load i64, i64* %i2, align 8, !dbg !161
  %cmp4 = icmp ult i64 %5, 100, !dbg !163
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !164

for.body5:                                        ; preds = %for.cond3
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !165
  %7 = load i64, i64* %i2, align 8, !dbg !167
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !165
  %8 = load i64, i64* %i2, align 8, !dbg !168
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !169
  %9 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !169
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !169
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !169
  br label %for.inc8, !dbg !170

for.inc8:                                         ; preds = %for.body5
  %11 = load i64, i64* %i2, align 8, !dbg !171
  %inc9 = add i64 %11, 1, !dbg !171
  store i64 %inc9, i64* %i2, align 8, !dbg !171
  br label %for.cond3, !dbg !172, !llvm.loop !173

for.end10:                                        ; preds = %for.cond3
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !175
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !175
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !176
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !177
  %14 = bitcast %struct._twoIntsStruct* %13 to i8*, !dbg !177
  call void @free(i8* %14) #5, !dbg !178
  ret void, !dbg !179
}

declare dso_local %struct._twoIntsStruct* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_22_goodG2B1Source(%struct._twoIntsStruct*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !180 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !181, metadata !DIExpression()), !dbg !182
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !183
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_22_goodG2B2Global, align 4, !dbg !184
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !185
  %call = call %struct._twoIntsStruct* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_22_goodG2B2Source(%struct._twoIntsStruct* %0), !dbg !186
  store %struct._twoIntsStruct* %call, %struct._twoIntsStruct** %data, align 8, !dbg !187
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !188, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.declare(metadata i64* %i, metadata !191, metadata !DIExpression()), !dbg !193
  store i64 0, i64* %i, align 8, !dbg !194
  br label %for.cond, !dbg !196

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !197
  %cmp = icmp ult i64 %1, 100, !dbg !199
  br i1 %cmp, label %for.body, label %for.end, !dbg !200

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !201
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !203
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !204
  store i32 0, i32* %intOne, align 8, !dbg !205
  %3 = load i64, i64* %i, align 8, !dbg !206
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !207
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !208
  store i32 0, i32* %intTwo, align 4, !dbg !209
  br label %for.inc, !dbg !210

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !211
  %inc = add i64 %4, 1, !dbg !211
  store i64 %inc, i64* %i, align 8, !dbg !211
  br label %for.cond, !dbg !212, !llvm.loop !213

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !215, metadata !DIExpression()), !dbg !217
  store i64 0, i64* %i2, align 8, !dbg !218
  br label %for.cond3, !dbg !220

for.cond3:                                        ; preds = %for.inc8, %for.end
  %5 = load i64, i64* %i2, align 8, !dbg !221
  %cmp4 = icmp ult i64 %5, 100, !dbg !223
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !224

for.body5:                                        ; preds = %for.cond3
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !225
  %7 = load i64, i64* %i2, align 8, !dbg !227
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !225
  %8 = load i64, i64* %i2, align 8, !dbg !228
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !229
  %9 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !229
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !229
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !229
  br label %for.inc8, !dbg !230

for.inc8:                                         ; preds = %for.body5
  %11 = load i64, i64* %i2, align 8, !dbg !231
  %inc9 = add i64 %11, 1, !dbg !231
  store i64 %inc9, i64* %i2, align 8, !dbg !231
  br label %for.cond3, !dbg !232, !llvm.loop !233

for.end10:                                        ; preds = %for.cond3
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !235
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !235
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !236
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !237
  %14 = bitcast %struct._twoIntsStruct* %13 to i8*, !dbg !237
  call void @free(i8* %14) #5, !dbg !238
  ret void, !dbg !239
}

declare dso_local %struct._twoIntsStruct* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_22_goodG2B2Source(%struct._twoIntsStruct*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_22_badGlobal", scope: !2, file: !10, line: 22, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_22_goodG2B1Global", scope: !2, file: !10, line: 61, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_22_goodG2B2Global", scope: !2, file: !10, line: 62, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_22_bad", scope: !10, file: !10, line: 26, type: !21, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 28, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !26, line: 100, baseType: !27)
!26 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!27 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !26, line: 96, size: 64, elements: !28)
!28 = !{!29, !30}
!29 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !27, file: !26, line: 98, baseType: !11, size: 32)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !27, file: !26, line: 99, baseType: !11, size: 32, offset: 32)
!31 = !DILocation(line: 28, column: 21, scope: !20)
!32 = !DILocation(line: 29, column: 10, scope: !20)
!33 = !DILocation(line: 30, column: 74, scope: !20)
!34 = !DILocation(line: 31, column: 81, scope: !20)
!35 = !DILocation(line: 31, column: 12, scope: !20)
!36 = !DILocation(line: 31, column: 10, scope: !20)
!37 = !DILocalVariable(name: "source", scope: !38, file: !10, line: 33, type: !39)
!38 = distinct !DILexicalBlock(scope: !20, file: !10, line: 32, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 6400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 33, column: 23, scope: !38)
!43 = !DILocalVariable(name: "i", scope: !44, file: !10, line: 35, type: !45)
!44 = distinct !DILexicalBlock(scope: !38, file: !10, line: 34, column: 9)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 46, baseType: !47)
!46 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 35, column: 20, scope: !44)
!49 = !DILocation(line: 37, column: 20, scope: !50)
!50 = distinct !DILexicalBlock(scope: !44, file: !10, line: 37, column: 13)
!51 = !DILocation(line: 37, column: 18, scope: !50)
!52 = !DILocation(line: 37, column: 25, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !10, line: 37, column: 13)
!54 = !DILocation(line: 37, column: 27, scope: !53)
!55 = !DILocation(line: 37, column: 13, scope: !50)
!56 = !DILocation(line: 39, column: 24, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !10, line: 38, column: 13)
!58 = !DILocation(line: 39, column: 17, scope: !57)
!59 = !DILocation(line: 39, column: 27, scope: !57)
!60 = !DILocation(line: 39, column: 34, scope: !57)
!61 = !DILocation(line: 40, column: 24, scope: !57)
!62 = !DILocation(line: 40, column: 17, scope: !57)
!63 = !DILocation(line: 40, column: 27, scope: !57)
!64 = !DILocation(line: 40, column: 34, scope: !57)
!65 = !DILocation(line: 41, column: 13, scope: !57)
!66 = !DILocation(line: 37, column: 35, scope: !53)
!67 = !DILocation(line: 37, column: 13, scope: !53)
!68 = distinct !{!68, !55, !69, !70}
!69 = !DILocation(line: 41, column: 13, scope: !50)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocalVariable(name: "i", scope: !72, file: !10, line: 44, type: !45)
!72 = distinct !DILexicalBlock(scope: !38, file: !10, line: 43, column: 9)
!73 = !DILocation(line: 44, column: 20, scope: !72)
!74 = !DILocation(line: 46, column: 20, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !10, line: 46, column: 13)
!76 = !DILocation(line: 46, column: 18, scope: !75)
!77 = !DILocation(line: 46, column: 25, scope: !78)
!78 = distinct !DILexicalBlock(scope: !75, file: !10, line: 46, column: 13)
!79 = !DILocation(line: 46, column: 27, scope: !78)
!80 = !DILocation(line: 46, column: 13, scope: !75)
!81 = !DILocation(line: 48, column: 17, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !10, line: 47, column: 13)
!83 = !DILocation(line: 48, column: 22, scope: !82)
!84 = !DILocation(line: 48, column: 34, scope: !82)
!85 = !DILocation(line: 48, column: 27, scope: !82)
!86 = !DILocation(line: 49, column: 13, scope: !82)
!87 = !DILocation(line: 46, column: 35, scope: !78)
!88 = !DILocation(line: 46, column: 13, scope: !78)
!89 = distinct !{!89, !80, !90, !70}
!90 = !DILocation(line: 49, column: 13, scope: !75)
!91 = !DILocation(line: 50, column: 30, scope: !72)
!92 = !DILocation(line: 50, column: 13, scope: !72)
!93 = !DILocation(line: 51, column: 18, scope: !72)
!94 = !DILocation(line: 51, column: 13, scope: !72)
!95 = !DILocation(line: 54, column: 1, scope: !20)
!96 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_22_good", scope: !10, file: !10, line: 130, type: !21, scopeLine: 131, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!97 = !DILocation(line: 132, column: 5, scope: !96)
!98 = !DILocation(line: 133, column: 5, scope: !96)
!99 = !DILocation(line: 134, column: 1, scope: !96)
!100 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 146, type: !101, scopeLine: 147, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!101 = !DISubroutineType(types: !102)
!102 = !{!11, !11, !103}
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!106 = !DILocalVariable(name: "argc", arg: 1, scope: !100, file: !10, line: 146, type: !11)
!107 = !DILocation(line: 146, column: 14, scope: !100)
!108 = !DILocalVariable(name: "argv", arg: 2, scope: !100, file: !10, line: 146, type: !103)
!109 = !DILocation(line: 146, column: 27, scope: !100)
!110 = !DILocation(line: 149, column: 22, scope: !100)
!111 = !DILocation(line: 149, column: 12, scope: !100)
!112 = !DILocation(line: 149, column: 5, scope: !100)
!113 = !DILocation(line: 151, column: 5, scope: !100)
!114 = !DILocation(line: 152, column: 5, scope: !100)
!115 = !DILocation(line: 153, column: 5, scope: !100)
!116 = !DILocation(line: 156, column: 5, scope: !100)
!117 = !DILocation(line: 157, column: 5, scope: !100)
!118 = !DILocation(line: 158, column: 5, scope: !100)
!119 = !DILocation(line: 160, column: 5, scope: !100)
!120 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 67, type: !21, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!121 = !DILocalVariable(name: "data", scope: !120, file: !10, line: 69, type: !24)
!122 = !DILocation(line: 69, column: 21, scope: !120)
!123 = !DILocation(line: 70, column: 10, scope: !120)
!124 = !DILocation(line: 71, column: 79, scope: !120)
!125 = !DILocation(line: 72, column: 86, scope: !120)
!126 = !DILocation(line: 72, column: 12, scope: !120)
!127 = !DILocation(line: 72, column: 10, scope: !120)
!128 = !DILocalVariable(name: "source", scope: !129, file: !10, line: 74, type: !39)
!129 = distinct !DILexicalBlock(scope: !120, file: !10, line: 73, column: 5)
!130 = !DILocation(line: 74, column: 23, scope: !129)
!131 = !DILocalVariable(name: "i", scope: !132, file: !10, line: 76, type: !45)
!132 = distinct !DILexicalBlock(scope: !129, file: !10, line: 75, column: 9)
!133 = !DILocation(line: 76, column: 20, scope: !132)
!134 = !DILocation(line: 78, column: 20, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !10, line: 78, column: 13)
!136 = !DILocation(line: 78, column: 18, scope: !135)
!137 = !DILocation(line: 78, column: 25, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !10, line: 78, column: 13)
!139 = !DILocation(line: 78, column: 27, scope: !138)
!140 = !DILocation(line: 78, column: 13, scope: !135)
!141 = !DILocation(line: 80, column: 24, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !10, line: 79, column: 13)
!143 = !DILocation(line: 80, column: 17, scope: !142)
!144 = !DILocation(line: 80, column: 27, scope: !142)
!145 = !DILocation(line: 80, column: 34, scope: !142)
!146 = !DILocation(line: 81, column: 24, scope: !142)
!147 = !DILocation(line: 81, column: 17, scope: !142)
!148 = !DILocation(line: 81, column: 27, scope: !142)
!149 = !DILocation(line: 81, column: 34, scope: !142)
!150 = !DILocation(line: 82, column: 13, scope: !142)
!151 = !DILocation(line: 78, column: 35, scope: !138)
!152 = !DILocation(line: 78, column: 13, scope: !138)
!153 = distinct !{!153, !140, !154, !70}
!154 = !DILocation(line: 82, column: 13, scope: !135)
!155 = !DILocalVariable(name: "i", scope: !156, file: !10, line: 85, type: !45)
!156 = distinct !DILexicalBlock(scope: !129, file: !10, line: 84, column: 9)
!157 = !DILocation(line: 85, column: 20, scope: !156)
!158 = !DILocation(line: 87, column: 20, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !10, line: 87, column: 13)
!160 = !DILocation(line: 87, column: 18, scope: !159)
!161 = !DILocation(line: 87, column: 25, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !10, line: 87, column: 13)
!163 = !DILocation(line: 87, column: 27, scope: !162)
!164 = !DILocation(line: 87, column: 13, scope: !159)
!165 = !DILocation(line: 89, column: 17, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !10, line: 88, column: 13)
!167 = !DILocation(line: 89, column: 22, scope: !166)
!168 = !DILocation(line: 89, column: 34, scope: !166)
!169 = !DILocation(line: 89, column: 27, scope: !166)
!170 = !DILocation(line: 90, column: 13, scope: !166)
!171 = !DILocation(line: 87, column: 35, scope: !162)
!172 = !DILocation(line: 87, column: 13, scope: !162)
!173 = distinct !{!173, !164, !174, !70}
!174 = !DILocation(line: 90, column: 13, scope: !159)
!175 = !DILocation(line: 91, column: 30, scope: !156)
!176 = !DILocation(line: 91, column: 13, scope: !156)
!177 = !DILocation(line: 92, column: 18, scope: !156)
!178 = !DILocation(line: 92, column: 13, scope: !156)
!179 = !DILocation(line: 95, column: 1, scope: !120)
!180 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 100, type: !21, scopeLine: 101, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!181 = !DILocalVariable(name: "data", scope: !180, file: !10, line: 102, type: !24)
!182 = !DILocation(line: 102, column: 21, scope: !180)
!183 = !DILocation(line: 103, column: 10, scope: !180)
!184 = !DILocation(line: 104, column: 79, scope: !180)
!185 = !DILocation(line: 105, column: 86, scope: !180)
!186 = !DILocation(line: 105, column: 12, scope: !180)
!187 = !DILocation(line: 105, column: 10, scope: !180)
!188 = !DILocalVariable(name: "source", scope: !189, file: !10, line: 107, type: !39)
!189 = distinct !DILexicalBlock(scope: !180, file: !10, line: 106, column: 5)
!190 = !DILocation(line: 107, column: 23, scope: !189)
!191 = !DILocalVariable(name: "i", scope: !192, file: !10, line: 109, type: !45)
!192 = distinct !DILexicalBlock(scope: !189, file: !10, line: 108, column: 9)
!193 = !DILocation(line: 109, column: 20, scope: !192)
!194 = !DILocation(line: 111, column: 20, scope: !195)
!195 = distinct !DILexicalBlock(scope: !192, file: !10, line: 111, column: 13)
!196 = !DILocation(line: 111, column: 18, scope: !195)
!197 = !DILocation(line: 111, column: 25, scope: !198)
!198 = distinct !DILexicalBlock(scope: !195, file: !10, line: 111, column: 13)
!199 = !DILocation(line: 111, column: 27, scope: !198)
!200 = !DILocation(line: 111, column: 13, scope: !195)
!201 = !DILocation(line: 113, column: 24, scope: !202)
!202 = distinct !DILexicalBlock(scope: !198, file: !10, line: 112, column: 13)
!203 = !DILocation(line: 113, column: 17, scope: !202)
!204 = !DILocation(line: 113, column: 27, scope: !202)
!205 = !DILocation(line: 113, column: 34, scope: !202)
!206 = !DILocation(line: 114, column: 24, scope: !202)
!207 = !DILocation(line: 114, column: 17, scope: !202)
!208 = !DILocation(line: 114, column: 27, scope: !202)
!209 = !DILocation(line: 114, column: 34, scope: !202)
!210 = !DILocation(line: 115, column: 13, scope: !202)
!211 = !DILocation(line: 111, column: 35, scope: !198)
!212 = !DILocation(line: 111, column: 13, scope: !198)
!213 = distinct !{!213, !200, !214, !70}
!214 = !DILocation(line: 115, column: 13, scope: !195)
!215 = !DILocalVariable(name: "i", scope: !216, file: !10, line: 118, type: !45)
!216 = distinct !DILexicalBlock(scope: !189, file: !10, line: 117, column: 9)
!217 = !DILocation(line: 118, column: 20, scope: !216)
!218 = !DILocation(line: 120, column: 20, scope: !219)
!219 = distinct !DILexicalBlock(scope: !216, file: !10, line: 120, column: 13)
!220 = !DILocation(line: 120, column: 18, scope: !219)
!221 = !DILocation(line: 120, column: 25, scope: !222)
!222 = distinct !DILexicalBlock(scope: !219, file: !10, line: 120, column: 13)
!223 = !DILocation(line: 120, column: 27, scope: !222)
!224 = !DILocation(line: 120, column: 13, scope: !219)
!225 = !DILocation(line: 122, column: 17, scope: !226)
!226 = distinct !DILexicalBlock(scope: !222, file: !10, line: 121, column: 13)
!227 = !DILocation(line: 122, column: 22, scope: !226)
!228 = !DILocation(line: 122, column: 34, scope: !226)
!229 = !DILocation(line: 122, column: 27, scope: !226)
!230 = !DILocation(line: 123, column: 13, scope: !226)
!231 = !DILocation(line: 120, column: 35, scope: !222)
!232 = !DILocation(line: 120, column: 13, scope: !222)
!233 = distinct !{!233, !224, !234, !70}
!234 = !DILocation(line: 123, column: 13, scope: !219)
!235 = !DILocation(line: 124, column: 30, scope: !216)
!236 = !DILocation(line: 124, column: 13, scope: !216)
!237 = !DILocation(line: 125, column: 18, scope: !216)
!238 = !DILocation(line: 125, column: 13, scope: !216)
!239 = !DILocation(line: 128, column: 1, scope: !180)
