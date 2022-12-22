; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_08_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %call = call i32 @staticReturnsTrue(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end3, !dbg !29

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !30
  %0 = bitcast i8* %call1 to %struct._twoIntsStruct*, !dbg !32
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !33
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !34
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !36
  br i1 %cmp, label %if.then2, label %if.end, !dbg !37

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !40

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !41, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %if.end3
  %2 = load i64, i64* %i, align 8, !dbg !56
  %cmp4 = icmp ult i64 %2, 100, !dbg !58
  br i1 %cmp4, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !62
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !63
  store i32 0, i32* %intOne, align 8, !dbg !64
  %4 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx5 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !66
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !67
  store i32 0, i32* %intTwo, align 4, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %5, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !75
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !76
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !76
  %8 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !76
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 800, i1 false), !dbg !76
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !77
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !77
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx6), !dbg !78
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !79
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !79
  call void @free(i8* %11) #6, !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_08_good() #0 !dbg !82 {
entry:
  call void @goodG2B1(), !dbg !83
  call void @goodG2B2(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !86 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* null) #6, !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 %conv) #6, !dbg !98
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_08_good(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_08_bad(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !106 {
entry:
  ret i32 1, !dbg !109
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !110 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !111, metadata !DIExpression()), !dbg !112
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !113
  %call = call i32 @staticReturnsFalse(), !dbg !114
  %tobool = icmp ne i32 %call, 0, !dbg !114
  br i1 %tobool, label %if.then, label %if.else, !dbg !116

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !117
  br label %if.end3, !dbg !119

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !120
  %0 = bitcast i8* %call1 to %struct._twoIntsStruct*, !dbg !122
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !123
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !124
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !126
  br i1 %cmp, label %if.then2, label %if.end, !dbg !127

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !128
  unreachable, !dbg !128

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !130, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata i64* %i, metadata !133, metadata !DIExpression()), !dbg !135
  store i64 0, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %if.end3
  %2 = load i64, i64* %i, align 8, !dbg !139
  %cmp4 = icmp ult i64 %2, 100, !dbg !141
  br i1 %cmp4, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !145
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !146
  store i32 0, i32* %intOne, align 8, !dbg !147
  %4 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx5 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !149
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !150
  store i32 0, i32* %intTwo, align 4, !dbg !151
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !153
  %inc = add i64 %5, 1, !dbg !153
  store i64 %inc, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !154, !llvm.loop !155

for.end:                                          ; preds = %for.cond
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !157
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !158
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !158
  %8 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !158
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 800, i1 false), !dbg !158
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !159
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !159
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx6), !dbg !160
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !161
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !161
  call void @free(i8* %11) #6, !dbg !162
  ret void, !dbg !163
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !164 {
entry:
  ret i32 0, !dbg !165
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !166 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !167, metadata !DIExpression()), !dbg !168
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !169
  %call = call i32 @staticReturnsTrue(), !dbg !170
  %tobool = icmp ne i32 %call, 0, !dbg !170
  br i1 %tobool, label %if.then, label %if.end3, !dbg !172

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !173
  %0 = bitcast i8* %call1 to %struct._twoIntsStruct*, !dbg !175
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !176
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !177
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !179
  br i1 %cmp, label %if.then2, label %if.end, !dbg !180

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !181
  unreachable, !dbg !181

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !183

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !184, metadata !DIExpression()), !dbg !186
  call void @llvm.dbg.declare(metadata i64* %i, metadata !187, metadata !DIExpression()), !dbg !189
  store i64 0, i64* %i, align 8, !dbg !190
  br label %for.cond, !dbg !192

for.cond:                                         ; preds = %for.inc, %if.end3
  %2 = load i64, i64* %i, align 8, !dbg !193
  %cmp4 = icmp ult i64 %2, 100, !dbg !195
  br i1 %cmp4, label %for.body, label %for.end, !dbg !196

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !197
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !199
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !200
  store i32 0, i32* %intOne, align 8, !dbg !201
  %4 = load i64, i64* %i, align 8, !dbg !202
  %arrayidx5 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !203
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !204
  store i32 0, i32* %intTwo, align 4, !dbg !205
  br label %for.inc, !dbg !206

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !207
  %inc = add i64 %5, 1, !dbg !207
  store i64 %inc, i64* %i, align 8, !dbg !207
  br label %for.cond, !dbg !208, !llvm.loop !209

for.end:                                          ; preds = %for.cond
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !211
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !212
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !212
  %8 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !212
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 800, i1 false), !dbg !212
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !213
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !213
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx6), !dbg !214
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !215
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !215
  call void @free(i8* %11) #6, !dbg !216
  ret void, !dbg !217
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_08.c", directory: "/root/SSE-Assessment")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_08_bad", scope: !21, file: !21, line: 35, type: !22, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_08.c", directory: "/root/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 37, type: !4)
!25 = !DILocation(line: 37, column: 21, scope: !20)
!26 = !DILocation(line: 38, column: 10, scope: !20)
!27 = !DILocation(line: 39, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !20, file: !21, line: 39, column: 8)
!29 = !DILocation(line: 39, column: 8, scope: !20)
!30 = !DILocation(line: 42, column: 33, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !21, line: 40, column: 5)
!32 = !DILocation(line: 42, column: 16, scope: !31)
!33 = !DILocation(line: 42, column: 14, scope: !31)
!34 = !DILocation(line: 43, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !21, line: 43, column: 13)
!36 = !DILocation(line: 43, column: 18, scope: !35)
!37 = !DILocation(line: 43, column: 13, scope: !31)
!38 = !DILocation(line: 43, column: 28, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !21, line: 43, column: 27)
!40 = !DILocation(line: 44, column: 5, scope: !31)
!41 = !DILocalVariable(name: "source", scope: !42, file: !21, line: 46, type: !43)
!42 = distinct !DILexicalBlock(scope: !20, file: !21, line: 45, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 46, column: 23, scope: !42)
!47 = !DILocalVariable(name: "i", scope: !48, file: !21, line: 48, type: !49)
!48 = distinct !DILexicalBlock(scope: !42, file: !21, line: 47, column: 9)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !50, line: 46, baseType: !51)
!50 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!51 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 48, column: 20, scope: !48)
!53 = !DILocation(line: 50, column: 20, scope: !54)
!54 = distinct !DILexicalBlock(scope: !48, file: !21, line: 50, column: 13)
!55 = !DILocation(line: 50, column: 18, scope: !54)
!56 = !DILocation(line: 50, column: 25, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !21, line: 50, column: 13)
!58 = !DILocation(line: 50, column: 27, scope: !57)
!59 = !DILocation(line: 50, column: 13, scope: !54)
!60 = !DILocation(line: 52, column: 24, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !21, line: 51, column: 13)
!62 = !DILocation(line: 52, column: 17, scope: !61)
!63 = !DILocation(line: 52, column: 27, scope: !61)
!64 = !DILocation(line: 52, column: 34, scope: !61)
!65 = !DILocation(line: 53, column: 24, scope: !61)
!66 = !DILocation(line: 53, column: 17, scope: !61)
!67 = !DILocation(line: 53, column: 27, scope: !61)
!68 = !DILocation(line: 53, column: 34, scope: !61)
!69 = !DILocation(line: 54, column: 13, scope: !61)
!70 = !DILocation(line: 50, column: 35, scope: !57)
!71 = !DILocation(line: 50, column: 13, scope: !57)
!72 = distinct !{!72, !59, !73, !74}
!73 = !DILocation(line: 54, column: 13, scope: !54)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 57, column: 17, scope: !42)
!76 = !DILocation(line: 57, column: 9, scope: !42)
!77 = !DILocation(line: 58, column: 26, scope: !42)
!78 = !DILocation(line: 58, column: 9, scope: !42)
!79 = !DILocation(line: 59, column: 14, scope: !42)
!80 = !DILocation(line: 59, column: 9, scope: !42)
!81 = !DILocation(line: 61, column: 1, scope: !20)
!82 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_08_good", scope: !21, file: !21, line: 130, type: !22, scopeLine: 131, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 132, column: 5, scope: !82)
!84 = !DILocation(line: 133, column: 5, scope: !82)
!85 = !DILocation(line: 134, column: 1, scope: !82)
!86 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 146, type: !87, scopeLine: 147, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DISubroutineType(types: !88)
!88 = !{!10, !10, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !21, line: 146, type: !10)
!93 = !DILocation(line: 146, column: 14, scope: !86)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !21, line: 146, type: !89)
!95 = !DILocation(line: 146, column: 27, scope: !86)
!96 = !DILocation(line: 149, column: 22, scope: !86)
!97 = !DILocation(line: 149, column: 12, scope: !86)
!98 = !DILocation(line: 149, column: 5, scope: !86)
!99 = !DILocation(line: 151, column: 5, scope: !86)
!100 = !DILocation(line: 152, column: 5, scope: !86)
!101 = !DILocation(line: 153, column: 5, scope: !86)
!102 = !DILocation(line: 156, column: 5, scope: !86)
!103 = !DILocation(line: 157, column: 5, scope: !86)
!104 = !DILocation(line: 158, column: 5, scope: !86)
!105 = !DILocation(line: 160, column: 5, scope: !86)
!106 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !21, file: !21, line: 23, type: !107, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DISubroutineType(types: !108)
!108 = !{!10}
!109 = !DILocation(line: 25, column: 5, scope: !106)
!110 = distinct !DISubprogram(name: "goodG2B1", scope: !21, file: !21, line: 68, type: !22, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocalVariable(name: "data", scope: !110, file: !21, line: 70, type: !4)
!112 = !DILocation(line: 70, column: 21, scope: !110)
!113 = !DILocation(line: 71, column: 10, scope: !110)
!114 = !DILocation(line: 72, column: 8, scope: !115)
!115 = distinct !DILexicalBlock(scope: !110, file: !21, line: 72, column: 8)
!116 = !DILocation(line: 72, column: 8, scope: !110)
!117 = !DILocation(line: 75, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !21, line: 73, column: 5)
!119 = !DILocation(line: 76, column: 5, scope: !118)
!120 = !DILocation(line: 80, column: 33, scope: !121)
!121 = distinct !DILexicalBlock(scope: !115, file: !21, line: 78, column: 5)
!122 = !DILocation(line: 80, column: 16, scope: !121)
!123 = !DILocation(line: 80, column: 14, scope: !121)
!124 = !DILocation(line: 81, column: 13, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !21, line: 81, column: 13)
!126 = !DILocation(line: 81, column: 18, scope: !125)
!127 = !DILocation(line: 81, column: 13, scope: !121)
!128 = !DILocation(line: 81, column: 28, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !21, line: 81, column: 27)
!130 = !DILocalVariable(name: "source", scope: !131, file: !21, line: 84, type: !43)
!131 = distinct !DILexicalBlock(scope: !110, file: !21, line: 83, column: 5)
!132 = !DILocation(line: 84, column: 23, scope: !131)
!133 = !DILocalVariable(name: "i", scope: !134, file: !21, line: 86, type: !49)
!134 = distinct !DILexicalBlock(scope: !131, file: !21, line: 85, column: 9)
!135 = !DILocation(line: 86, column: 20, scope: !134)
!136 = !DILocation(line: 88, column: 20, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !21, line: 88, column: 13)
!138 = !DILocation(line: 88, column: 18, scope: !137)
!139 = !DILocation(line: 88, column: 25, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !21, line: 88, column: 13)
!141 = !DILocation(line: 88, column: 27, scope: !140)
!142 = !DILocation(line: 88, column: 13, scope: !137)
!143 = !DILocation(line: 90, column: 24, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !21, line: 89, column: 13)
!145 = !DILocation(line: 90, column: 17, scope: !144)
!146 = !DILocation(line: 90, column: 27, scope: !144)
!147 = !DILocation(line: 90, column: 34, scope: !144)
!148 = !DILocation(line: 91, column: 24, scope: !144)
!149 = !DILocation(line: 91, column: 17, scope: !144)
!150 = !DILocation(line: 91, column: 27, scope: !144)
!151 = !DILocation(line: 91, column: 34, scope: !144)
!152 = !DILocation(line: 92, column: 13, scope: !144)
!153 = !DILocation(line: 88, column: 35, scope: !140)
!154 = !DILocation(line: 88, column: 13, scope: !140)
!155 = distinct !{!155, !142, !156, !74}
!156 = !DILocation(line: 92, column: 13, scope: !137)
!157 = !DILocation(line: 95, column: 17, scope: !131)
!158 = !DILocation(line: 95, column: 9, scope: !131)
!159 = !DILocation(line: 96, column: 26, scope: !131)
!160 = !DILocation(line: 96, column: 9, scope: !131)
!161 = !DILocation(line: 97, column: 14, scope: !131)
!162 = !DILocation(line: 97, column: 9, scope: !131)
!163 = !DILocation(line: 99, column: 1, scope: !110)
!164 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !21, file: !21, line: 28, type: !107, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!165 = !DILocation(line: 30, column: 5, scope: !164)
!166 = distinct !DISubprogram(name: "goodG2B2", scope: !21, file: !21, line: 102, type: !22, scopeLine: 103, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!167 = !DILocalVariable(name: "data", scope: !166, file: !21, line: 104, type: !4)
!168 = !DILocation(line: 104, column: 21, scope: !166)
!169 = !DILocation(line: 105, column: 10, scope: !166)
!170 = !DILocation(line: 106, column: 8, scope: !171)
!171 = distinct !DILexicalBlock(scope: !166, file: !21, line: 106, column: 8)
!172 = !DILocation(line: 106, column: 8, scope: !166)
!173 = !DILocation(line: 109, column: 33, scope: !174)
!174 = distinct !DILexicalBlock(scope: !171, file: !21, line: 107, column: 5)
!175 = !DILocation(line: 109, column: 16, scope: !174)
!176 = !DILocation(line: 109, column: 14, scope: !174)
!177 = !DILocation(line: 110, column: 13, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !21, line: 110, column: 13)
!179 = !DILocation(line: 110, column: 18, scope: !178)
!180 = !DILocation(line: 110, column: 13, scope: !174)
!181 = !DILocation(line: 110, column: 28, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !21, line: 110, column: 27)
!183 = !DILocation(line: 111, column: 5, scope: !174)
!184 = !DILocalVariable(name: "source", scope: !185, file: !21, line: 113, type: !43)
!185 = distinct !DILexicalBlock(scope: !166, file: !21, line: 112, column: 5)
!186 = !DILocation(line: 113, column: 23, scope: !185)
!187 = !DILocalVariable(name: "i", scope: !188, file: !21, line: 115, type: !49)
!188 = distinct !DILexicalBlock(scope: !185, file: !21, line: 114, column: 9)
!189 = !DILocation(line: 115, column: 20, scope: !188)
!190 = !DILocation(line: 117, column: 20, scope: !191)
!191 = distinct !DILexicalBlock(scope: !188, file: !21, line: 117, column: 13)
!192 = !DILocation(line: 117, column: 18, scope: !191)
!193 = !DILocation(line: 117, column: 25, scope: !194)
!194 = distinct !DILexicalBlock(scope: !191, file: !21, line: 117, column: 13)
!195 = !DILocation(line: 117, column: 27, scope: !194)
!196 = !DILocation(line: 117, column: 13, scope: !191)
!197 = !DILocation(line: 119, column: 24, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !21, line: 118, column: 13)
!199 = !DILocation(line: 119, column: 17, scope: !198)
!200 = !DILocation(line: 119, column: 27, scope: !198)
!201 = !DILocation(line: 119, column: 34, scope: !198)
!202 = !DILocation(line: 120, column: 24, scope: !198)
!203 = !DILocation(line: 120, column: 17, scope: !198)
!204 = !DILocation(line: 120, column: 27, scope: !198)
!205 = !DILocation(line: 120, column: 34, scope: !198)
!206 = !DILocation(line: 121, column: 13, scope: !198)
!207 = !DILocation(line: 117, column: 35, scope: !194)
!208 = !DILocation(line: 117, column: 13, scope: !194)
!209 = distinct !{!209, !196, !210, !74}
!210 = !DILocation(line: 121, column: 13, scope: !191)
!211 = !DILocation(line: 124, column: 17, scope: !185)
!212 = !DILocation(line: 124, column: 9, scope: !185)
!213 = !DILocation(line: 125, column: 26, scope: !185)
!214 = !DILocation(line: 125, column: 9, scope: !185)
!215 = !DILocation(line: 126, column: 14, scope: !185)
!216 = !DILocation(line: 126, column: 9, scope: !185)
!217 = !DILocation(line: 128, column: 1, scope: !166)
