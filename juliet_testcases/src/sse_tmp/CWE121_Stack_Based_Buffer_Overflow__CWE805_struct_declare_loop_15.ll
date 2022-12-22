; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_15_bad() #0 !dbg !11 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !15, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !35
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !37, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !49
  %cmp = icmp ult i64 %0, 100, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !55
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !56
  store i32 0, i32* %intOne, align 8, !dbg !57
  %2 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !59
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !60
  store i32 0, i32* %intTwo, align 4, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %3, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !68, metadata !DIExpression()), !dbg !70
  store i64 0, i64* %i2, align 8, !dbg !71
  br label %for.cond3, !dbg !73

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !74
  %cmp4 = icmp ult i64 %4, 100, !dbg !76
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !77

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !78
  %6 = load i64, i64* %i2, align 8, !dbg !80
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !78
  %7 = load i64, i64* %i2, align 8, !dbg !81
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !82
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !82
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !82
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !82
  br label %for.inc8, !dbg !83

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !84
  %inc9 = add i64 %10, 1, !dbg !84
  store i64 %inc9, i64* %i2, align 8, !dbg !84
  br label %for.cond3, !dbg !85, !llvm.loop !86

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !88
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !88
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_15_good() #0 !dbg !91 {
entry:
  call void @goodG2B1(), !dbg !92
  call void @goodG2B2(), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !95 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !101, metadata !DIExpression()), !dbg !102
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !103, metadata !DIExpression()), !dbg !104
  %call = call i64 @time(i64* null) #5, !dbg !105
  %conv = trunc i64 %call to i32, !dbg !106
  call void @srand(i32 %conv) #5, !dbg !107
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !108
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_15_good(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !111
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_15_bad(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !113
  ret i32 0, !dbg !114
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !115 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !122
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !124, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i64* %i, metadata !127, metadata !DIExpression()), !dbg !129
  store i64 0, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !133
  %cmp = icmp ult i64 %0, 100, !dbg !135
  br i1 %cmp, label %for.body, label %for.end, !dbg !136

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !139
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !140
  store i32 0, i32* %intOne, align 8, !dbg !141
  %2 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !143
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !144
  store i32 0, i32* %intTwo, align 4, !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !147
  %inc = add i64 %3, 1, !dbg !147
  store i64 %inc, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !151, metadata !DIExpression()), !dbg !153
  store i64 0, i64* %i2, align 8, !dbg !154
  br label %for.cond3, !dbg !156

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !157
  %cmp4 = icmp ult i64 %4, 100, !dbg !159
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !160

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !161
  %6 = load i64, i64* %i2, align 8, !dbg !163
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !161
  %7 = load i64, i64* %i2, align 8, !dbg !164
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !165
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !165
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !165
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !165
  br label %for.inc8, !dbg !166

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !167
  %inc9 = add i64 %10, 1, !dbg !167
  store i64 %inc9, i64* %i2, align 8, !dbg !167
  br label %for.cond3, !dbg !168, !llvm.loop !169

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !171
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !171
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !172
  ret void, !dbg !173
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !174 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !175, metadata !DIExpression()), !dbg !176
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !177, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !179, metadata !DIExpression()), !dbg !180
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !181
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !182
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !183, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.declare(metadata i64* %i, metadata !186, metadata !DIExpression()), !dbg !188
  store i64 0, i64* %i, align 8, !dbg !189
  br label %for.cond, !dbg !191

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !192
  %cmp = icmp ult i64 %0, 100, !dbg !194
  br i1 %cmp, label %for.body, label %for.end, !dbg !195

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !196
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !198
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !199
  store i32 0, i32* %intOne, align 8, !dbg !200
  %2 = load i64, i64* %i, align 8, !dbg !201
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !202
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !203
  store i32 0, i32* %intTwo, align 4, !dbg !204
  br label %for.inc, !dbg !205

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !206
  %inc = add i64 %3, 1, !dbg !206
  store i64 %inc, i64* %i, align 8, !dbg !206
  br label %for.cond, !dbg !207, !llvm.loop !208

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !210, metadata !DIExpression()), !dbg !212
  store i64 0, i64* %i2, align 8, !dbg !213
  br label %for.cond3, !dbg !215

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !216
  %cmp4 = icmp ult i64 %4, 100, !dbg !218
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !219

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !220
  %6 = load i64, i64* %i2, align 8, !dbg !222
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !220
  %7 = load i64, i64* %i2, align 8, !dbg !223
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !224
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !224
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !224
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !224
  br label %for.inc8, !dbg !225

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !226
  %inc9 = add i64 %10, 1, !dbg !226
  store i64 %inc9, i64* %i2, align 8, !dbg !226
  br label %for.cond3, !dbg !227, !llvm.loop !228

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !230
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !230
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !231
  ret void, !dbg !232
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_15.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_15_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_15.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !18, line: 100, baseType: !19)
!18 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
!19 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !18, line: 96, size: 64, elements: !20)
!20 = !{!21, !23}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !19, file: !18, line: 98, baseType: !22, size: 32)
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !19, file: !18, line: 99, baseType: !22, size: 32, offset: 32)
!24 = !DILocation(line: 23, column: 21, scope: !11)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 24, column: 19, scope: !11)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 25, column: 19, scope: !11)
!35 = !DILocation(line: 31, column: 16, scope: !11)
!36 = !DILocation(line: 31, column: 14, scope: !11)
!37 = !DILocalVariable(name: "source", scope: !38, file: !12, line: 39, type: !31)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 5)
!39 = !DILocation(line: 39, column: 23, scope: !38)
!40 = !DILocalVariable(name: "i", scope: !41, file: !12, line: 41, type: !42)
!41 = distinct !DILexicalBlock(scope: !38, file: !12, line: 40, column: 9)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 41, column: 20, scope: !41)
!46 = !DILocation(line: 43, column: 20, scope: !47)
!47 = distinct !DILexicalBlock(scope: !41, file: !12, line: 43, column: 13)
!48 = !DILocation(line: 43, column: 18, scope: !47)
!49 = !DILocation(line: 43, column: 25, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !12, line: 43, column: 13)
!51 = !DILocation(line: 43, column: 27, scope: !50)
!52 = !DILocation(line: 43, column: 13, scope: !47)
!53 = !DILocation(line: 45, column: 24, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !12, line: 44, column: 13)
!55 = !DILocation(line: 45, column: 17, scope: !54)
!56 = !DILocation(line: 45, column: 27, scope: !54)
!57 = !DILocation(line: 45, column: 34, scope: !54)
!58 = !DILocation(line: 46, column: 24, scope: !54)
!59 = !DILocation(line: 46, column: 17, scope: !54)
!60 = !DILocation(line: 46, column: 27, scope: !54)
!61 = !DILocation(line: 46, column: 34, scope: !54)
!62 = !DILocation(line: 47, column: 13, scope: !54)
!63 = !DILocation(line: 43, column: 35, scope: !50)
!64 = !DILocation(line: 43, column: 13, scope: !50)
!65 = distinct !{!65, !52, !66, !67}
!66 = !DILocation(line: 47, column: 13, scope: !47)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocalVariable(name: "i", scope: !69, file: !12, line: 50, type: !42)
!69 = distinct !DILexicalBlock(scope: !38, file: !12, line: 49, column: 9)
!70 = !DILocation(line: 50, column: 20, scope: !69)
!71 = !DILocation(line: 52, column: 20, scope: !72)
!72 = distinct !DILexicalBlock(scope: !69, file: !12, line: 52, column: 13)
!73 = !DILocation(line: 52, column: 18, scope: !72)
!74 = !DILocation(line: 52, column: 25, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !12, line: 52, column: 13)
!76 = !DILocation(line: 52, column: 27, scope: !75)
!77 = !DILocation(line: 52, column: 13, scope: !72)
!78 = !DILocation(line: 54, column: 17, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !12, line: 53, column: 13)
!80 = !DILocation(line: 54, column: 22, scope: !79)
!81 = !DILocation(line: 54, column: 34, scope: !79)
!82 = !DILocation(line: 54, column: 27, scope: !79)
!83 = !DILocation(line: 55, column: 13, scope: !79)
!84 = !DILocation(line: 52, column: 35, scope: !75)
!85 = !DILocation(line: 52, column: 13, scope: !75)
!86 = distinct !{!86, !77, !87, !67}
!87 = !DILocation(line: 55, column: 13, scope: !72)
!88 = !DILocation(line: 56, column: 30, scope: !69)
!89 = !DILocation(line: 56, column: 13, scope: !69)
!90 = !DILocation(line: 59, column: 1, scope: !11)
!91 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_15_good", scope: !12, file: !12, line: 145, type: !13, scopeLine: 146, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocation(line: 147, column: 5, scope: !91)
!93 = !DILocation(line: 148, column: 5, scope: !91)
!94 = !DILocation(line: 149, column: 1, scope: !91)
!95 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 161, type: !96, scopeLine: 162, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DISubroutineType(types: !97)
!97 = !{!22, !22, !98}
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!101 = !DILocalVariable(name: "argc", arg: 1, scope: !95, file: !12, line: 161, type: !22)
!102 = !DILocation(line: 161, column: 14, scope: !95)
!103 = !DILocalVariable(name: "argv", arg: 2, scope: !95, file: !12, line: 161, type: !98)
!104 = !DILocation(line: 161, column: 27, scope: !95)
!105 = !DILocation(line: 164, column: 22, scope: !95)
!106 = !DILocation(line: 164, column: 12, scope: !95)
!107 = !DILocation(line: 164, column: 5, scope: !95)
!108 = !DILocation(line: 166, column: 5, scope: !95)
!109 = !DILocation(line: 167, column: 5, scope: !95)
!110 = !DILocation(line: 168, column: 5, scope: !95)
!111 = !DILocation(line: 171, column: 5, scope: !95)
!112 = !DILocation(line: 172, column: 5, scope: !95)
!113 = !DILocation(line: 173, column: 5, scope: !95)
!114 = !DILocation(line: 175, column: 5, scope: !95)
!115 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 66, type: !13, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocalVariable(name: "data", scope: !115, file: !12, line: 68, type: !16)
!117 = !DILocation(line: 68, column: 21, scope: !115)
!118 = !DILocalVariable(name: "dataBadBuffer", scope: !115, file: !12, line: 69, type: !26)
!119 = !DILocation(line: 69, column: 19, scope: !115)
!120 = !DILocalVariable(name: "dataGoodBuffer", scope: !115, file: !12, line: 70, type: !31)
!121 = !DILocation(line: 70, column: 19, scope: !115)
!122 = !DILocation(line: 79, column: 16, scope: !115)
!123 = !DILocation(line: 79, column: 14, scope: !115)
!124 = !DILocalVariable(name: "source", scope: !125, file: !12, line: 83, type: !31)
!125 = distinct !DILexicalBlock(scope: !115, file: !12, line: 82, column: 5)
!126 = !DILocation(line: 83, column: 23, scope: !125)
!127 = !DILocalVariable(name: "i", scope: !128, file: !12, line: 85, type: !42)
!128 = distinct !DILexicalBlock(scope: !125, file: !12, line: 84, column: 9)
!129 = !DILocation(line: 85, column: 20, scope: !128)
!130 = !DILocation(line: 87, column: 20, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !12, line: 87, column: 13)
!132 = !DILocation(line: 87, column: 18, scope: !131)
!133 = !DILocation(line: 87, column: 25, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !12, line: 87, column: 13)
!135 = !DILocation(line: 87, column: 27, scope: !134)
!136 = !DILocation(line: 87, column: 13, scope: !131)
!137 = !DILocation(line: 89, column: 24, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !12, line: 88, column: 13)
!139 = !DILocation(line: 89, column: 17, scope: !138)
!140 = !DILocation(line: 89, column: 27, scope: !138)
!141 = !DILocation(line: 89, column: 34, scope: !138)
!142 = !DILocation(line: 90, column: 24, scope: !138)
!143 = !DILocation(line: 90, column: 17, scope: !138)
!144 = !DILocation(line: 90, column: 27, scope: !138)
!145 = !DILocation(line: 90, column: 34, scope: !138)
!146 = !DILocation(line: 91, column: 13, scope: !138)
!147 = !DILocation(line: 87, column: 35, scope: !134)
!148 = !DILocation(line: 87, column: 13, scope: !134)
!149 = distinct !{!149, !136, !150, !67}
!150 = !DILocation(line: 91, column: 13, scope: !131)
!151 = !DILocalVariable(name: "i", scope: !152, file: !12, line: 94, type: !42)
!152 = distinct !DILexicalBlock(scope: !125, file: !12, line: 93, column: 9)
!153 = !DILocation(line: 94, column: 20, scope: !152)
!154 = !DILocation(line: 96, column: 20, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !12, line: 96, column: 13)
!156 = !DILocation(line: 96, column: 18, scope: !155)
!157 = !DILocation(line: 96, column: 25, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !12, line: 96, column: 13)
!159 = !DILocation(line: 96, column: 27, scope: !158)
!160 = !DILocation(line: 96, column: 13, scope: !155)
!161 = !DILocation(line: 98, column: 17, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !12, line: 97, column: 13)
!163 = !DILocation(line: 98, column: 22, scope: !162)
!164 = !DILocation(line: 98, column: 34, scope: !162)
!165 = !DILocation(line: 98, column: 27, scope: !162)
!166 = !DILocation(line: 99, column: 13, scope: !162)
!167 = !DILocation(line: 96, column: 35, scope: !158)
!168 = !DILocation(line: 96, column: 13, scope: !158)
!169 = distinct !{!169, !160, !170, !67}
!170 = !DILocation(line: 99, column: 13, scope: !155)
!171 = !DILocation(line: 100, column: 30, scope: !152)
!172 = !DILocation(line: 100, column: 13, scope: !152)
!173 = !DILocation(line: 103, column: 1, scope: !115)
!174 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 106, type: !13, scopeLine: 107, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!175 = !DILocalVariable(name: "data", scope: !174, file: !12, line: 108, type: !16)
!176 = !DILocation(line: 108, column: 21, scope: !174)
!177 = !DILocalVariable(name: "dataBadBuffer", scope: !174, file: !12, line: 109, type: !26)
!178 = !DILocation(line: 109, column: 19, scope: !174)
!179 = !DILocalVariable(name: "dataGoodBuffer", scope: !174, file: !12, line: 110, type: !31)
!180 = !DILocation(line: 110, column: 19, scope: !174)
!181 = !DILocation(line: 115, column: 16, scope: !174)
!182 = !DILocation(line: 115, column: 14, scope: !174)
!183 = !DILocalVariable(name: "source", scope: !184, file: !12, line: 123, type: !31)
!184 = distinct !DILexicalBlock(scope: !174, file: !12, line: 122, column: 5)
!185 = !DILocation(line: 123, column: 23, scope: !184)
!186 = !DILocalVariable(name: "i", scope: !187, file: !12, line: 125, type: !42)
!187 = distinct !DILexicalBlock(scope: !184, file: !12, line: 124, column: 9)
!188 = !DILocation(line: 125, column: 20, scope: !187)
!189 = !DILocation(line: 127, column: 20, scope: !190)
!190 = distinct !DILexicalBlock(scope: !187, file: !12, line: 127, column: 13)
!191 = !DILocation(line: 127, column: 18, scope: !190)
!192 = !DILocation(line: 127, column: 25, scope: !193)
!193 = distinct !DILexicalBlock(scope: !190, file: !12, line: 127, column: 13)
!194 = !DILocation(line: 127, column: 27, scope: !193)
!195 = !DILocation(line: 127, column: 13, scope: !190)
!196 = !DILocation(line: 129, column: 24, scope: !197)
!197 = distinct !DILexicalBlock(scope: !193, file: !12, line: 128, column: 13)
!198 = !DILocation(line: 129, column: 17, scope: !197)
!199 = !DILocation(line: 129, column: 27, scope: !197)
!200 = !DILocation(line: 129, column: 34, scope: !197)
!201 = !DILocation(line: 130, column: 24, scope: !197)
!202 = !DILocation(line: 130, column: 17, scope: !197)
!203 = !DILocation(line: 130, column: 27, scope: !197)
!204 = !DILocation(line: 130, column: 34, scope: !197)
!205 = !DILocation(line: 131, column: 13, scope: !197)
!206 = !DILocation(line: 127, column: 35, scope: !193)
!207 = !DILocation(line: 127, column: 13, scope: !193)
!208 = distinct !{!208, !195, !209, !67}
!209 = !DILocation(line: 131, column: 13, scope: !190)
!210 = !DILocalVariable(name: "i", scope: !211, file: !12, line: 134, type: !42)
!211 = distinct !DILexicalBlock(scope: !184, file: !12, line: 133, column: 9)
!212 = !DILocation(line: 134, column: 20, scope: !211)
!213 = !DILocation(line: 136, column: 20, scope: !214)
!214 = distinct !DILexicalBlock(scope: !211, file: !12, line: 136, column: 13)
!215 = !DILocation(line: 136, column: 18, scope: !214)
!216 = !DILocation(line: 136, column: 25, scope: !217)
!217 = distinct !DILexicalBlock(scope: !214, file: !12, line: 136, column: 13)
!218 = !DILocation(line: 136, column: 27, scope: !217)
!219 = !DILocation(line: 136, column: 13, scope: !214)
!220 = !DILocation(line: 138, column: 17, scope: !221)
!221 = distinct !DILexicalBlock(scope: !217, file: !12, line: 137, column: 13)
!222 = !DILocation(line: 138, column: 22, scope: !221)
!223 = !DILocation(line: 138, column: 34, scope: !221)
!224 = !DILocation(line: 138, column: 27, scope: !221)
!225 = !DILocation(line: 139, column: 13, scope: !221)
!226 = !DILocation(line: 136, column: 35, scope: !217)
!227 = !DILocation(line: 136, column: 13, scope: !217)
!228 = distinct !{!228, !219, !229, !67}
!229 = !DILocation(line: 139, column: 13, scope: !214)
!230 = !DILocation(line: 140, column: 30, scope: !211)
!231 = !DILocation(line: 140, column: 13, scope: !211)
!232 = !DILocation(line: 143, column: 1, scope: !174)
