; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_12_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i10 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.else, !dbg !29

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
  br label %if.end7, !dbg !40

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !41
  %2 = bitcast i8* %call3 to %struct._twoIntsStruct*, !dbg !43
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %data, align 8, !dbg !44
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !45
  %cmp4 = icmp eq %struct._twoIntsStruct* %3, null, !dbg !47
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !48

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !49
  unreachable, !dbg !49

if.end6:                                          ; preds = %if.else
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !51, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i64* %i, metadata !57, metadata !DIExpression()), !dbg !62
  store i64 0, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc, %if.end7
  %4 = load i64, i64* %i, align 8, !dbg !66
  %cmp8 = icmp ult i64 %4, 100, !dbg !68
  br i1 %cmp8, label %for.body, label %for.end, !dbg !69

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !72
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !73
  store i32 0, i32* %intOne, align 8, !dbg !74
  %6 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx9 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !76
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx9, i32 0, i32 1, !dbg !77
  store i32 0, i32* %intTwo, align 4, !dbg !78
  br label %for.inc, !dbg !79

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !80
  %inc = add i64 %7, 1, !dbg !80
  store i64 %inc, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !81, !llvm.loop !82

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i10, metadata !85, metadata !DIExpression()), !dbg !87
  store i64 0, i64* %i10, align 8, !dbg !88
  br label %for.cond11, !dbg !90

for.cond11:                                       ; preds = %for.inc16, %for.end
  %8 = load i64, i64* %i10, align 8, !dbg !91
  %cmp12 = icmp ult i64 %8, 100, !dbg !93
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !94

for.body13:                                       ; preds = %for.cond11
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !95
  %10 = load i64, i64* %i10, align 8, !dbg !97
  %arrayidx14 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 %10, !dbg !95
  %11 = load i64, i64* %i10, align 8, !dbg !98
  %arrayidx15 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %11, !dbg !99
  %12 = bitcast %struct._twoIntsStruct* %arrayidx14 to i8*, !dbg !99
  %13 = bitcast %struct._twoIntsStruct* %arrayidx15 to i8*, !dbg !99
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %12, i8* align 8 %13, i64 8, i1 false), !dbg !99
  br label %for.inc16, !dbg !100

for.inc16:                                        ; preds = %for.body13
  %14 = load i64, i64* %i10, align 8, !dbg !101
  %inc17 = add i64 %14, 1, !dbg !101
  store i64 %inc17, i64* %i10, align 8, !dbg !101
  br label %for.cond11, !dbg !102, !llvm.loop !103

for.end18:                                        ; preds = %for.cond11
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !105
  %arrayidx19 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %15, i64 0, !dbg !105
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx19), !dbg !106
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !107
  %17 = bitcast %struct._twoIntsStruct* %16 to i8*, !dbg !107
  call void @free(i8* %17) #6, !dbg !108
  ret void, !dbg !109
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_12_good() #0 !dbg !110 {
entry:
  call void @goodG2B(), !dbg !111
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !113 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !119, metadata !DIExpression()), !dbg !120
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !121, metadata !DIExpression()), !dbg !122
  %call = call i64 @time(i64* null) #6, !dbg !123
  %conv = trunc i64 %call to i32, !dbg !124
  call void @srand(i32 %conv) #6, !dbg !125
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !126
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_12_good(), !dbg !127
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !128
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !129
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_12_bad(), !dbg !130
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !131
  ret i32 0, !dbg !132
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !133 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i10 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !134, metadata !DIExpression()), !dbg !135
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !136
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !137
  %tobool = icmp ne i32 %call, 0, !dbg !137
  br i1 %tobool, label %if.then, label %if.else, !dbg !139

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !140
  %0 = bitcast i8* %call1 to %struct._twoIntsStruct*, !dbg !142
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !143
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !144
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !146
  br i1 %cmp, label %if.then2, label %if.end, !dbg !147

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !148
  unreachable, !dbg !148

if.end:                                           ; preds = %if.then
  br label %if.end7, !dbg !150

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !151
  %2 = bitcast i8* %call3 to %struct._twoIntsStruct*, !dbg !153
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %data, align 8, !dbg !154
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !155
  %cmp4 = icmp eq %struct._twoIntsStruct* %3, null, !dbg !157
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !158

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !159
  unreachable, !dbg !159

if.end6:                                          ; preds = %if.else
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !161, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.declare(metadata i64* %i, metadata !164, metadata !DIExpression()), !dbg !166
  store i64 0, i64* %i, align 8, !dbg !167
  br label %for.cond, !dbg !169

for.cond:                                         ; preds = %for.inc, %if.end7
  %4 = load i64, i64* %i, align 8, !dbg !170
  %cmp8 = icmp ult i64 %4, 100, !dbg !172
  br i1 %cmp8, label %for.body, label %for.end, !dbg !173

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !174
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !176
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !177
  store i32 0, i32* %intOne, align 8, !dbg !178
  %6 = load i64, i64* %i, align 8, !dbg !179
  %arrayidx9 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !180
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx9, i32 0, i32 1, !dbg !181
  store i32 0, i32* %intTwo, align 4, !dbg !182
  br label %for.inc, !dbg !183

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !184
  %inc = add i64 %7, 1, !dbg !184
  store i64 %inc, i64* %i, align 8, !dbg !184
  br label %for.cond, !dbg !185, !llvm.loop !186

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i10, metadata !188, metadata !DIExpression()), !dbg !190
  store i64 0, i64* %i10, align 8, !dbg !191
  br label %for.cond11, !dbg !193

for.cond11:                                       ; preds = %for.inc16, %for.end
  %8 = load i64, i64* %i10, align 8, !dbg !194
  %cmp12 = icmp ult i64 %8, 100, !dbg !196
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !197

for.body13:                                       ; preds = %for.cond11
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !198
  %10 = load i64, i64* %i10, align 8, !dbg !200
  %arrayidx14 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 %10, !dbg !198
  %11 = load i64, i64* %i10, align 8, !dbg !201
  %arrayidx15 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %11, !dbg !202
  %12 = bitcast %struct._twoIntsStruct* %arrayidx14 to i8*, !dbg !202
  %13 = bitcast %struct._twoIntsStruct* %arrayidx15 to i8*, !dbg !202
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %12, i8* align 8 %13, i64 8, i1 false), !dbg !202
  br label %for.inc16, !dbg !203

for.inc16:                                        ; preds = %for.body13
  %14 = load i64, i64* %i10, align 8, !dbg !204
  %inc17 = add i64 %14, 1, !dbg !204
  store i64 %inc17, i64* %i10, align 8, !dbg !204
  br label %for.cond11, !dbg !205, !llvm.loop !206

for.end18:                                        ; preds = %for.cond11
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !208
  %arrayidx19 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %15, i64 0, !dbg !208
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx19), !dbg !209
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !210
  %17 = bitcast %struct._twoIntsStruct* %16 to i8*, !dbg !210
  call void @free(i8* %17) #6, !dbg !211
  ret void, !dbg !212
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_12_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 23, type: !4)
!25 = !DILocation(line: 23, column: 21, scope: !20)
!26 = !DILocation(line: 24, column: 10, scope: !20)
!27 = !DILocation(line: 25, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !20, file: !21, line: 25, column: 8)
!29 = !DILocation(line: 25, column: 8, scope: !20)
!30 = !DILocation(line: 28, column: 33, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !21, line: 26, column: 5)
!32 = !DILocation(line: 28, column: 16, scope: !31)
!33 = !DILocation(line: 28, column: 14, scope: !31)
!34 = !DILocation(line: 29, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !21, line: 29, column: 13)
!36 = !DILocation(line: 29, column: 18, scope: !35)
!37 = !DILocation(line: 29, column: 13, scope: !31)
!38 = !DILocation(line: 29, column: 28, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !21, line: 29, column: 27)
!40 = !DILocation(line: 30, column: 5, scope: !31)
!41 = !DILocation(line: 34, column: 33, scope: !42)
!42 = distinct !DILexicalBlock(scope: !28, file: !21, line: 32, column: 5)
!43 = !DILocation(line: 34, column: 16, scope: !42)
!44 = !DILocation(line: 34, column: 14, scope: !42)
!45 = !DILocation(line: 35, column: 13, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !21, line: 35, column: 13)
!47 = !DILocation(line: 35, column: 18, scope: !46)
!48 = !DILocation(line: 35, column: 13, scope: !42)
!49 = !DILocation(line: 35, column: 28, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !21, line: 35, column: 27)
!51 = !DILocalVariable(name: "source", scope: !52, file: !21, line: 38, type: !53)
!52 = distinct !DILexicalBlock(scope: !20, file: !21, line: 37, column: 5)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 100)
!56 = !DILocation(line: 38, column: 23, scope: !52)
!57 = !DILocalVariable(name: "i", scope: !58, file: !21, line: 40, type: !59)
!58 = distinct !DILexicalBlock(scope: !52, file: !21, line: 39, column: 9)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !60, line: 46, baseType: !61)
!60 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!61 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!62 = !DILocation(line: 40, column: 20, scope: !58)
!63 = !DILocation(line: 42, column: 20, scope: !64)
!64 = distinct !DILexicalBlock(scope: !58, file: !21, line: 42, column: 13)
!65 = !DILocation(line: 42, column: 18, scope: !64)
!66 = !DILocation(line: 42, column: 25, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !21, line: 42, column: 13)
!68 = !DILocation(line: 42, column: 27, scope: !67)
!69 = !DILocation(line: 42, column: 13, scope: !64)
!70 = !DILocation(line: 44, column: 24, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !21, line: 43, column: 13)
!72 = !DILocation(line: 44, column: 17, scope: !71)
!73 = !DILocation(line: 44, column: 27, scope: !71)
!74 = !DILocation(line: 44, column: 34, scope: !71)
!75 = !DILocation(line: 45, column: 24, scope: !71)
!76 = !DILocation(line: 45, column: 17, scope: !71)
!77 = !DILocation(line: 45, column: 27, scope: !71)
!78 = !DILocation(line: 45, column: 34, scope: !71)
!79 = !DILocation(line: 46, column: 13, scope: !71)
!80 = !DILocation(line: 42, column: 35, scope: !67)
!81 = !DILocation(line: 42, column: 13, scope: !67)
!82 = distinct !{!82, !69, !83, !84}
!83 = !DILocation(line: 46, column: 13, scope: !64)
!84 = !{!"llvm.loop.mustprogress"}
!85 = !DILocalVariable(name: "i", scope: !86, file: !21, line: 49, type: !59)
!86 = distinct !DILexicalBlock(scope: !52, file: !21, line: 48, column: 9)
!87 = !DILocation(line: 49, column: 20, scope: !86)
!88 = !DILocation(line: 51, column: 20, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !21, line: 51, column: 13)
!90 = !DILocation(line: 51, column: 18, scope: !89)
!91 = !DILocation(line: 51, column: 25, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !21, line: 51, column: 13)
!93 = !DILocation(line: 51, column: 27, scope: !92)
!94 = !DILocation(line: 51, column: 13, scope: !89)
!95 = !DILocation(line: 53, column: 17, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !21, line: 52, column: 13)
!97 = !DILocation(line: 53, column: 22, scope: !96)
!98 = !DILocation(line: 53, column: 34, scope: !96)
!99 = !DILocation(line: 53, column: 27, scope: !96)
!100 = !DILocation(line: 54, column: 13, scope: !96)
!101 = !DILocation(line: 51, column: 35, scope: !92)
!102 = !DILocation(line: 51, column: 13, scope: !92)
!103 = distinct !{!103, !94, !104, !84}
!104 = !DILocation(line: 54, column: 13, scope: !89)
!105 = !DILocation(line: 55, column: 30, scope: !86)
!106 = !DILocation(line: 55, column: 13, scope: !86)
!107 = !DILocation(line: 56, column: 18, scope: !86)
!108 = !DILocation(line: 56, column: 13, scope: !86)
!109 = !DILocation(line: 59, column: 1, scope: !20)
!110 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_12_good", scope: !21, file: !21, line: 107, type: !22, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocation(line: 109, column: 5, scope: !110)
!112 = !DILocation(line: 110, column: 1, scope: !110)
!113 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 122, type: !114, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DISubroutineType(types: !115)
!115 = !{!10, !10, !116}
!116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !117, size: 64)
!117 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !118, size: 64)
!118 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!119 = !DILocalVariable(name: "argc", arg: 1, scope: !113, file: !21, line: 122, type: !10)
!120 = !DILocation(line: 122, column: 14, scope: !113)
!121 = !DILocalVariable(name: "argv", arg: 2, scope: !113, file: !21, line: 122, type: !116)
!122 = !DILocation(line: 122, column: 27, scope: !113)
!123 = !DILocation(line: 125, column: 22, scope: !113)
!124 = !DILocation(line: 125, column: 12, scope: !113)
!125 = !DILocation(line: 125, column: 5, scope: !113)
!126 = !DILocation(line: 127, column: 5, scope: !113)
!127 = !DILocation(line: 128, column: 5, scope: !113)
!128 = !DILocation(line: 129, column: 5, scope: !113)
!129 = !DILocation(line: 132, column: 5, scope: !113)
!130 = !DILocation(line: 133, column: 5, scope: !113)
!131 = !DILocation(line: 134, column: 5, scope: !113)
!132 = !DILocation(line: 136, column: 5, scope: !113)
!133 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 67, type: !22, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!134 = !DILocalVariable(name: "data", scope: !133, file: !21, line: 69, type: !4)
!135 = !DILocation(line: 69, column: 21, scope: !133)
!136 = !DILocation(line: 70, column: 10, scope: !133)
!137 = !DILocation(line: 71, column: 8, scope: !138)
!138 = distinct !DILexicalBlock(scope: !133, file: !21, line: 71, column: 8)
!139 = !DILocation(line: 71, column: 8, scope: !133)
!140 = !DILocation(line: 74, column: 33, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !21, line: 72, column: 5)
!142 = !DILocation(line: 74, column: 16, scope: !141)
!143 = !DILocation(line: 74, column: 14, scope: !141)
!144 = !DILocation(line: 75, column: 13, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !21, line: 75, column: 13)
!146 = !DILocation(line: 75, column: 18, scope: !145)
!147 = !DILocation(line: 75, column: 13, scope: !141)
!148 = !DILocation(line: 75, column: 28, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !21, line: 75, column: 27)
!150 = !DILocation(line: 76, column: 5, scope: !141)
!151 = !DILocation(line: 80, column: 33, scope: !152)
!152 = distinct !DILexicalBlock(scope: !138, file: !21, line: 78, column: 5)
!153 = !DILocation(line: 80, column: 16, scope: !152)
!154 = !DILocation(line: 80, column: 14, scope: !152)
!155 = !DILocation(line: 81, column: 13, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !21, line: 81, column: 13)
!157 = !DILocation(line: 81, column: 18, scope: !156)
!158 = !DILocation(line: 81, column: 13, scope: !152)
!159 = !DILocation(line: 81, column: 28, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !21, line: 81, column: 27)
!161 = !DILocalVariable(name: "source", scope: !162, file: !21, line: 84, type: !53)
!162 = distinct !DILexicalBlock(scope: !133, file: !21, line: 83, column: 5)
!163 = !DILocation(line: 84, column: 23, scope: !162)
!164 = !DILocalVariable(name: "i", scope: !165, file: !21, line: 86, type: !59)
!165 = distinct !DILexicalBlock(scope: !162, file: !21, line: 85, column: 9)
!166 = !DILocation(line: 86, column: 20, scope: !165)
!167 = !DILocation(line: 88, column: 20, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !21, line: 88, column: 13)
!169 = !DILocation(line: 88, column: 18, scope: !168)
!170 = !DILocation(line: 88, column: 25, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !21, line: 88, column: 13)
!172 = !DILocation(line: 88, column: 27, scope: !171)
!173 = !DILocation(line: 88, column: 13, scope: !168)
!174 = !DILocation(line: 90, column: 24, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !21, line: 89, column: 13)
!176 = !DILocation(line: 90, column: 17, scope: !175)
!177 = !DILocation(line: 90, column: 27, scope: !175)
!178 = !DILocation(line: 90, column: 34, scope: !175)
!179 = !DILocation(line: 91, column: 24, scope: !175)
!180 = !DILocation(line: 91, column: 17, scope: !175)
!181 = !DILocation(line: 91, column: 27, scope: !175)
!182 = !DILocation(line: 91, column: 34, scope: !175)
!183 = !DILocation(line: 92, column: 13, scope: !175)
!184 = !DILocation(line: 88, column: 35, scope: !171)
!185 = !DILocation(line: 88, column: 13, scope: !171)
!186 = distinct !{!186, !173, !187, !84}
!187 = !DILocation(line: 92, column: 13, scope: !168)
!188 = !DILocalVariable(name: "i", scope: !189, file: !21, line: 95, type: !59)
!189 = distinct !DILexicalBlock(scope: !162, file: !21, line: 94, column: 9)
!190 = !DILocation(line: 95, column: 20, scope: !189)
!191 = !DILocation(line: 97, column: 20, scope: !192)
!192 = distinct !DILexicalBlock(scope: !189, file: !21, line: 97, column: 13)
!193 = !DILocation(line: 97, column: 18, scope: !192)
!194 = !DILocation(line: 97, column: 25, scope: !195)
!195 = distinct !DILexicalBlock(scope: !192, file: !21, line: 97, column: 13)
!196 = !DILocation(line: 97, column: 27, scope: !195)
!197 = !DILocation(line: 97, column: 13, scope: !192)
!198 = !DILocation(line: 99, column: 17, scope: !199)
!199 = distinct !DILexicalBlock(scope: !195, file: !21, line: 98, column: 13)
!200 = !DILocation(line: 99, column: 22, scope: !199)
!201 = !DILocation(line: 99, column: 34, scope: !199)
!202 = !DILocation(line: 99, column: 27, scope: !199)
!203 = !DILocation(line: 100, column: 13, scope: !199)
!204 = !DILocation(line: 97, column: 35, scope: !195)
!205 = !DILocation(line: 97, column: 13, scope: !195)
!206 = distinct !{!206, !197, !207, !84}
!207 = !DILocation(line: 100, column: 13, scope: !192)
!208 = !DILocation(line: 101, column: 30, scope: !189)
!209 = !DILocation(line: 101, column: 13, scope: !189)
!210 = !DILocation(line: 102, column: 18, scope: !189)
!211 = !DILocation(line: 102, column: 13, scope: !189)
!212 = !DILocation(line: 105, column: 1, scope: !133)
