; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_45.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_45_badData = internal global %struct._twoIntsStruct* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_45_goodG2BData = internal global %struct._twoIntsStruct* null, align 8, !dbg !17

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_45_bad() #0 !dbg !26 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !29, metadata !DIExpression()), !dbg !30
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !31
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !32
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !33
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !34
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !35
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !41
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_45_badData, align 8, !dbg !42
  call void @badSink(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_45_good() #0 !dbg !45 {
entry:
  call void @goodG2B(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* null) #6, !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 %conv) #6, !dbg !60
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_45_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_45_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !68 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !69, metadata !DIExpression()), !dbg !70
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_45_badData, align 8, !dbg !71
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !72, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i64* %i, metadata !78, metadata !DIExpression()), !dbg !83
  store i64 0, i64* %i, align 8, !dbg !84
  br label %for.cond, !dbg !86

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !87
  %cmp = icmp ult i64 %1, 100, !dbg !89
  br i1 %cmp, label %for.body, label %for.end, !dbg !90

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !91
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !93
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !94
  store i32 0, i32* %intOne, align 8, !dbg !95
  %3 = load i64, i64* %i, align 8, !dbg !96
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !97
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !98
  store i32 0, i32* %intTwo, align 4, !dbg !99
  br label %for.inc, !dbg !100

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !101
  %inc = add i64 %4, 1, !dbg !101
  store i64 %inc, i64* %i, align 8, !dbg !101
  br label %for.cond, !dbg !102, !llvm.loop !103

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !106, metadata !DIExpression()), !dbg !108
  store i64 0, i64* %i2, align 8, !dbg !109
  br label %for.cond3, !dbg !111

for.cond3:                                        ; preds = %for.inc8, %for.end
  %5 = load i64, i64* %i2, align 8, !dbg !112
  %cmp4 = icmp ult i64 %5, 100, !dbg !114
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !115

for.body5:                                        ; preds = %for.cond3
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !116
  %7 = load i64, i64* %i2, align 8, !dbg !118
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !116
  %8 = load i64, i64* %i2, align 8, !dbg !119
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !120
  %9 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !120
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !120
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !120
  br label %for.inc8, !dbg !121

for.inc8:                                         ; preds = %for.body5
  %11 = load i64, i64* %i2, align 8, !dbg !122
  %inc9 = add i64 %11, 1, !dbg !122
  store i64 %inc9, i64* %i2, align 8, !dbg !122
  br label %for.cond3, !dbg !123, !llvm.loop !124

for.end10:                                        ; preds = %for.cond3
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !126
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !126
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !127
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !128
  %14 = bitcast %struct._twoIntsStruct* %13 to i8*, !dbg !128
  call void @free(i8* %14) #6, !dbg !129
  ret void, !dbg !130
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !131 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !132, metadata !DIExpression()), !dbg !133
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !134
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !135
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !136
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !137
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !138
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !140
  br i1 %cmp, label %if.then, label %if.end, !dbg !141

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !142
  unreachable, !dbg !142

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !144
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_45_goodG2BData, align 8, !dbg !145
  call void @goodG2BSink(), !dbg !146
  ret void, !dbg !147
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !148 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !149, metadata !DIExpression()), !dbg !150
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_45_goodG2BData, align 8, !dbg !151
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !150
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !152, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.declare(metadata i64* %i, metadata !155, metadata !DIExpression()), !dbg !157
  store i64 0, i64* %i, align 8, !dbg !158
  br label %for.cond, !dbg !160

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !161
  %cmp = icmp ult i64 %1, 100, !dbg !163
  br i1 %cmp, label %for.body, label %for.end, !dbg !164

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !165
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !167
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !168
  store i32 0, i32* %intOne, align 8, !dbg !169
  %3 = load i64, i64* %i, align 8, !dbg !170
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !171
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !172
  store i32 0, i32* %intTwo, align 4, !dbg !173
  br label %for.inc, !dbg !174

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !175
  %inc = add i64 %4, 1, !dbg !175
  store i64 %inc, i64* %i, align 8, !dbg !175
  br label %for.cond, !dbg !176, !llvm.loop !177

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !179, metadata !DIExpression()), !dbg !181
  store i64 0, i64* %i2, align 8, !dbg !182
  br label %for.cond3, !dbg !184

for.cond3:                                        ; preds = %for.inc8, %for.end
  %5 = load i64, i64* %i2, align 8, !dbg !185
  %cmp4 = icmp ult i64 %5, 100, !dbg !187
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !188

for.body5:                                        ; preds = %for.cond3
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !189
  %7 = load i64, i64* %i2, align 8, !dbg !191
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !189
  %8 = load i64, i64* %i2, align 8, !dbg !192
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !193
  %9 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !193
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !193
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !193
  br label %for.inc8, !dbg !194

for.inc8:                                         ; preds = %for.body5
  %11 = load i64, i64* %i2, align 8, !dbg !195
  %inc9 = add i64 %11, 1, !dbg !195
  store i64 %inc9, i64* %i2, align 8, !dbg !195
  br label %for.cond3, !dbg !196, !llvm.loop !197

for.end10:                                        ; preds = %for.cond3
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !199
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !199
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !200
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !201
  %14 = bitcast %struct._twoIntsStruct* %13 to i8*, !dbg !201
  call void @free(i8* %14) #6, !dbg !202
  ret void, !dbg !203
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!20, !21, !22, !23, !24}
!llvm.ident = !{!25}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_45_badData", scope: !2, file: !19, line: 19, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !16, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !14, !15}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !8, line: 100, baseType: !9)
!8 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !8, line: 96, size: 64, elements: !10)
!10 = !{!11, !13}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !9, file: !8, line: 98, baseType: !12, size: 32)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !9, file: !8, line: 99, baseType: !12, size: 32, offset: 32)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!15 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!16 = !{!0, !17}
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_45_goodG2BData", scope: !2, file: !19, line: 20, type: !6, isLocal: true, isDefinition: true)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_45.c", directory: "/root/SSE-Assessment")
!20 = !{i32 7, !"Dwarf Version", i32 4}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{i32 1, !"wchar_size", i32 4}
!23 = !{i32 7, !"uwtable", i32 1}
!24 = !{i32 7, !"frame-pointer", i32 2}
!25 = !{!"clang version 13.0.0"}
!26 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_45_bad", scope: !19, file: !19, line: 51, type: !27, scopeLine: 52, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!27 = !DISubroutineType(types: !28)
!28 = !{null}
!29 = !DILocalVariable(name: "data", scope: !26, file: !19, line: 53, type: !6)
!30 = !DILocation(line: 53, column: 21, scope: !26)
!31 = !DILocation(line: 54, column: 10, scope: !26)
!32 = !DILocation(line: 56, column: 29, scope: !26)
!33 = !DILocation(line: 56, column: 12, scope: !26)
!34 = !DILocation(line: 56, column: 10, scope: !26)
!35 = !DILocation(line: 57, column: 9, scope: !36)
!36 = distinct !DILexicalBlock(scope: !26, file: !19, line: 57, column: 9)
!37 = !DILocation(line: 57, column: 14, scope: !36)
!38 = !DILocation(line: 57, column: 9, scope: !26)
!39 = !DILocation(line: 57, column: 24, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !19, line: 57, column: 23)
!41 = !DILocation(line: 58, column: 74, scope: !26)
!42 = !DILocation(line: 58, column: 72, scope: !26)
!43 = !DILocation(line: 59, column: 5, scope: !26)
!44 = !DILocation(line: 60, column: 1, scope: !26)
!45 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_45_good", scope: !19, file: !19, line: 105, type: !27, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!46 = !DILocation(line: 107, column: 5, scope: !45)
!47 = !DILocation(line: 108, column: 1, scope: !45)
!48 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 119, type: !49, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!49 = !DISubroutineType(types: !50)
!50 = !{!12, !12, !51}
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !19, line: 119, type: !12)
!55 = !DILocation(line: 119, column: 14, scope: !48)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !19, line: 119, type: !51)
!57 = !DILocation(line: 119, column: 27, scope: !48)
!58 = !DILocation(line: 122, column: 22, scope: !48)
!59 = !DILocation(line: 122, column: 12, scope: !48)
!60 = !DILocation(line: 122, column: 5, scope: !48)
!61 = !DILocation(line: 124, column: 5, scope: !48)
!62 = !DILocation(line: 125, column: 5, scope: !48)
!63 = !DILocation(line: 126, column: 5, scope: !48)
!64 = !DILocation(line: 129, column: 5, scope: !48)
!65 = !DILocation(line: 130, column: 5, scope: !48)
!66 = !DILocation(line: 131, column: 5, scope: !48)
!67 = !DILocation(line: 133, column: 5, scope: !48)
!68 = distinct !DISubprogram(name: "badSink", scope: !19, file: !19, line: 24, type: !27, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DILocalVariable(name: "data", scope: !68, file: !19, line: 26, type: !6)
!70 = !DILocation(line: 26, column: 21, scope: !68)
!71 = !DILocation(line: 26, column: 28, scope: !68)
!72 = !DILocalVariable(name: "source", scope: !73, file: !19, line: 28, type: !74)
!73 = distinct !DILexicalBlock(scope: !68, file: !19, line: 27, column: 5)
!74 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 6400, elements: !75)
!75 = !{!76}
!76 = !DISubrange(count: 100)
!77 = !DILocation(line: 28, column: 23, scope: !73)
!78 = !DILocalVariable(name: "i", scope: !79, file: !19, line: 30, type: !80)
!79 = distinct !DILexicalBlock(scope: !73, file: !19, line: 29, column: 9)
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !81, line: 46, baseType: !82)
!81 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!82 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!83 = !DILocation(line: 30, column: 20, scope: !79)
!84 = !DILocation(line: 32, column: 20, scope: !85)
!85 = distinct !DILexicalBlock(scope: !79, file: !19, line: 32, column: 13)
!86 = !DILocation(line: 32, column: 18, scope: !85)
!87 = !DILocation(line: 32, column: 25, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !19, line: 32, column: 13)
!89 = !DILocation(line: 32, column: 27, scope: !88)
!90 = !DILocation(line: 32, column: 13, scope: !85)
!91 = !DILocation(line: 34, column: 24, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !19, line: 33, column: 13)
!93 = !DILocation(line: 34, column: 17, scope: !92)
!94 = !DILocation(line: 34, column: 27, scope: !92)
!95 = !DILocation(line: 34, column: 34, scope: !92)
!96 = !DILocation(line: 35, column: 24, scope: !92)
!97 = !DILocation(line: 35, column: 17, scope: !92)
!98 = !DILocation(line: 35, column: 27, scope: !92)
!99 = !DILocation(line: 35, column: 34, scope: !92)
!100 = !DILocation(line: 36, column: 13, scope: !92)
!101 = !DILocation(line: 32, column: 35, scope: !88)
!102 = !DILocation(line: 32, column: 13, scope: !88)
!103 = distinct !{!103, !90, !104, !105}
!104 = !DILocation(line: 36, column: 13, scope: !85)
!105 = !{!"llvm.loop.mustprogress"}
!106 = !DILocalVariable(name: "i", scope: !107, file: !19, line: 39, type: !80)
!107 = distinct !DILexicalBlock(scope: !73, file: !19, line: 38, column: 9)
!108 = !DILocation(line: 39, column: 20, scope: !107)
!109 = !DILocation(line: 41, column: 20, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !19, line: 41, column: 13)
!111 = !DILocation(line: 41, column: 18, scope: !110)
!112 = !DILocation(line: 41, column: 25, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !19, line: 41, column: 13)
!114 = !DILocation(line: 41, column: 27, scope: !113)
!115 = !DILocation(line: 41, column: 13, scope: !110)
!116 = !DILocation(line: 43, column: 17, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !19, line: 42, column: 13)
!118 = !DILocation(line: 43, column: 22, scope: !117)
!119 = !DILocation(line: 43, column: 34, scope: !117)
!120 = !DILocation(line: 43, column: 27, scope: !117)
!121 = !DILocation(line: 44, column: 13, scope: !117)
!122 = !DILocation(line: 41, column: 35, scope: !113)
!123 = !DILocation(line: 41, column: 13, scope: !113)
!124 = distinct !{!124, !115, !125, !105}
!125 = !DILocation(line: 44, column: 13, scope: !110)
!126 = !DILocation(line: 45, column: 30, scope: !107)
!127 = !DILocation(line: 45, column: 13, scope: !107)
!128 = !DILocation(line: 46, column: 18, scope: !107)
!129 = !DILocation(line: 46, column: 13, scope: !107)
!130 = !DILocation(line: 49, column: 1, scope: !68)
!131 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 94, type: !27, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!132 = !DILocalVariable(name: "data", scope: !131, file: !19, line: 96, type: !6)
!133 = !DILocation(line: 96, column: 21, scope: !131)
!134 = !DILocation(line: 97, column: 10, scope: !131)
!135 = !DILocation(line: 99, column: 29, scope: !131)
!136 = !DILocation(line: 99, column: 12, scope: !131)
!137 = !DILocation(line: 99, column: 10, scope: !131)
!138 = !DILocation(line: 100, column: 9, scope: !139)
!139 = distinct !DILexicalBlock(scope: !131, file: !19, line: 100, column: 9)
!140 = !DILocation(line: 100, column: 14, scope: !139)
!141 = !DILocation(line: 100, column: 9, scope: !131)
!142 = !DILocation(line: 100, column: 24, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !19, line: 100, column: 23)
!144 = !DILocation(line: 101, column: 78, scope: !131)
!145 = !DILocation(line: 101, column: 76, scope: !131)
!146 = !DILocation(line: 102, column: 5, scope: !131)
!147 = !DILocation(line: 103, column: 1, scope: !131)
!148 = distinct !DISubprogram(name: "goodG2BSink", scope: !19, file: !19, line: 67, type: !27, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!149 = !DILocalVariable(name: "data", scope: !148, file: !19, line: 69, type: !6)
!150 = !DILocation(line: 69, column: 21, scope: !148)
!151 = !DILocation(line: 69, column: 28, scope: !148)
!152 = !DILocalVariable(name: "source", scope: !153, file: !19, line: 71, type: !74)
!153 = distinct !DILexicalBlock(scope: !148, file: !19, line: 70, column: 5)
!154 = !DILocation(line: 71, column: 23, scope: !153)
!155 = !DILocalVariable(name: "i", scope: !156, file: !19, line: 73, type: !80)
!156 = distinct !DILexicalBlock(scope: !153, file: !19, line: 72, column: 9)
!157 = !DILocation(line: 73, column: 20, scope: !156)
!158 = !DILocation(line: 75, column: 20, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !19, line: 75, column: 13)
!160 = !DILocation(line: 75, column: 18, scope: !159)
!161 = !DILocation(line: 75, column: 25, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !19, line: 75, column: 13)
!163 = !DILocation(line: 75, column: 27, scope: !162)
!164 = !DILocation(line: 75, column: 13, scope: !159)
!165 = !DILocation(line: 77, column: 24, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !19, line: 76, column: 13)
!167 = !DILocation(line: 77, column: 17, scope: !166)
!168 = !DILocation(line: 77, column: 27, scope: !166)
!169 = !DILocation(line: 77, column: 34, scope: !166)
!170 = !DILocation(line: 78, column: 24, scope: !166)
!171 = !DILocation(line: 78, column: 17, scope: !166)
!172 = !DILocation(line: 78, column: 27, scope: !166)
!173 = !DILocation(line: 78, column: 34, scope: !166)
!174 = !DILocation(line: 79, column: 13, scope: !166)
!175 = !DILocation(line: 75, column: 35, scope: !162)
!176 = !DILocation(line: 75, column: 13, scope: !162)
!177 = distinct !{!177, !164, !178, !105}
!178 = !DILocation(line: 79, column: 13, scope: !159)
!179 = !DILocalVariable(name: "i", scope: !180, file: !19, line: 82, type: !80)
!180 = distinct !DILexicalBlock(scope: !153, file: !19, line: 81, column: 9)
!181 = !DILocation(line: 82, column: 20, scope: !180)
!182 = !DILocation(line: 84, column: 20, scope: !183)
!183 = distinct !DILexicalBlock(scope: !180, file: !19, line: 84, column: 13)
!184 = !DILocation(line: 84, column: 18, scope: !183)
!185 = !DILocation(line: 84, column: 25, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !19, line: 84, column: 13)
!187 = !DILocation(line: 84, column: 27, scope: !186)
!188 = !DILocation(line: 84, column: 13, scope: !183)
!189 = !DILocation(line: 86, column: 17, scope: !190)
!190 = distinct !DILexicalBlock(scope: !186, file: !19, line: 85, column: 13)
!191 = !DILocation(line: 86, column: 22, scope: !190)
!192 = !DILocation(line: 86, column: 34, scope: !190)
!193 = !DILocation(line: 86, column: 27, scope: !190)
!194 = !DILocation(line: 87, column: 13, scope: !190)
!195 = !DILocation(line: 84, column: 35, scope: !186)
!196 = !DILocation(line: 84, column: 13, scope: !186)
!197 = distinct !{!197, !188, !198, !105}
!198 = !DILocation(line: 87, column: 13, scope: !183)
!199 = !DILocation(line: 88, column: 30, scope: !180)
!200 = !DILocation(line: 88, column: 13, scope: !180)
!201 = !DILocation(line: 89, column: 18, scope: !180)
!202 = !DILocation(line: 89, column: 13, scope: !180)
!203 = !DILocation(line: 92, column: 1, scope: !148)
