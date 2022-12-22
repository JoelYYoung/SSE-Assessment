; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_17.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_17_bad() #0 !dbg !20 {
entry:
  %i = alloca i32, align 4
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i2 = alloca i64, align 8
  %i10 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !28
  store i32 0, i32* %i, align 4, !dbg !29
  br label %for.cond, !dbg !31

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !32
  %cmp = icmp slt i32 %0, 1, !dbg !34
  br i1 %cmp, label %for.body, label %for.end, !dbg !35

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !36
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !38
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !39
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !40
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !42
  br i1 %cmp1, label %if.then, label %if.end, !dbg !43

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #7, !dbg !44
  unreachable, !dbg !44

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %if.end
  %3 = load i32, i32* %i, align 4, !dbg !47
  %inc = add nsw i32 %3, 1, !dbg !47
  store i32 %inc, i32* %i, align 4, !dbg !47
  br label %for.cond, !dbg !48, !llvm.loop !49

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !52, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !58, metadata !DIExpression()), !dbg !63
  store i64 0, i64* %i2, align 8, !dbg !64
  br label %for.cond3, !dbg !66

for.cond3:                                        ; preds = %for.inc7, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !67
  %cmp4 = icmp ult i64 %4, 100, !dbg !69
  br i1 %cmp4, label %for.body5, label %for.end9, !dbg !70

for.body5:                                        ; preds = %for.cond3
  %5 = load i64, i64* %i2, align 8, !dbg !71
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !73
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !74
  store i32 0, i32* %intOne, align 8, !dbg !75
  %6 = load i64, i64* %i2, align 8, !dbg !76
  %arrayidx6 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !77
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx6, i32 0, i32 1, !dbg !78
  store i32 0, i32* %intTwo, align 4, !dbg !79
  br label %for.inc7, !dbg !80

for.inc7:                                         ; preds = %for.body5
  %7 = load i64, i64* %i2, align 8, !dbg !81
  %inc8 = add i64 %7, 1, !dbg !81
  store i64 %inc8, i64* %i2, align 8, !dbg !81
  br label %for.cond3, !dbg !82, !llvm.loop !83

for.end9:                                         ; preds = %for.cond3
  call void @llvm.dbg.declare(metadata i64* %i10, metadata !85, metadata !DIExpression()), !dbg !87
  store i64 0, i64* %i10, align 8, !dbg !88
  br label %for.cond11, !dbg !90

for.cond11:                                       ; preds = %for.inc16, %for.end9
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_17_good() #0 !dbg !110 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_17_good(), !dbg !127
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !128
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !129
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_17_bad(), !dbg !130
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !131
  ret i32 0, !dbg !132
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !133 {
entry:
  %h = alloca i32, align 4
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i9 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !136, metadata !DIExpression()), !dbg !137
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !138
  store i32 0, i32* %h, align 4, !dbg !139
  br label %for.cond, !dbg !141

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !142
  %cmp = icmp slt i32 %0, 1, !dbg !144
  br i1 %cmp, label %for.body, label %for.end, !dbg !145

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !146
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !148
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !149
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !150
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !152
  br i1 %cmp1, label %if.then, label %if.end, !dbg !153

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #7, !dbg !154
  unreachable, !dbg !154

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !156

for.inc:                                          ; preds = %if.end
  %3 = load i32, i32* %h, align 4, !dbg !157
  %inc = add nsw i32 %3, 1, !dbg !157
  store i32 %inc, i32* %h, align 4, !dbg !157
  br label %for.cond, !dbg !158, !llvm.loop !159

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !161, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.declare(metadata i64* %i, metadata !164, metadata !DIExpression()), !dbg !166
  store i64 0, i64* %i, align 8, !dbg !167
  br label %for.cond2, !dbg !169

for.cond2:                                        ; preds = %for.inc6, %for.end
  %4 = load i64, i64* %i, align 8, !dbg !170
  %cmp3 = icmp ult i64 %4, 100, !dbg !172
  br i1 %cmp3, label %for.body4, label %for.end8, !dbg !173

for.body4:                                        ; preds = %for.cond2
  %5 = load i64, i64* %i, align 8, !dbg !174
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !176
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !177
  store i32 0, i32* %intOne, align 8, !dbg !178
  %6 = load i64, i64* %i, align 8, !dbg !179
  %arrayidx5 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !180
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !181
  store i32 0, i32* %intTwo, align 4, !dbg !182
  br label %for.inc6, !dbg !183

for.inc6:                                         ; preds = %for.body4
  %7 = load i64, i64* %i, align 8, !dbg !184
  %inc7 = add i64 %7, 1, !dbg !184
  store i64 %inc7, i64* %i, align 8, !dbg !184
  br label %for.cond2, !dbg !185, !llvm.loop !186

for.end8:                                         ; preds = %for.cond2
  call void @llvm.dbg.declare(metadata i64* %i9, metadata !188, metadata !DIExpression()), !dbg !190
  store i64 0, i64* %i9, align 8, !dbg !191
  br label %for.cond10, !dbg !193

for.cond10:                                       ; preds = %for.inc15, %for.end8
  %8 = load i64, i64* %i9, align 8, !dbg !194
  %cmp11 = icmp ult i64 %8, 100, !dbg !196
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !197

for.body12:                                       ; preds = %for.cond10
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !198
  %10 = load i64, i64* %i9, align 8, !dbg !200
  %arrayidx13 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 %10, !dbg !198
  %11 = load i64, i64* %i9, align 8, !dbg !201
  %arrayidx14 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %11, !dbg !202
  %12 = bitcast %struct._twoIntsStruct* %arrayidx13 to i8*, !dbg !202
  %13 = bitcast %struct._twoIntsStruct* %arrayidx14 to i8*, !dbg !202
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %12, i8* align 8 %13, i64 8, i1 false), !dbg !202
  br label %for.inc15, !dbg !203

for.inc15:                                        ; preds = %for.body12
  %14 = load i64, i64* %i9, align 8, !dbg !204
  %inc16 = add i64 %14, 1, !dbg !204
  store i64 %inc16, i64* %i9, align 8, !dbg !204
  br label %for.cond10, !dbg !205, !llvm.loop !206

for.end17:                                        ; preds = %for.cond10
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !208
  %arrayidx18 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %15, i64 0, !dbg !208
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx18), !dbg !209
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !210
  %17 = bitcast %struct._twoIntsStruct* %16 to i8*, !dbg !210
  call void @free(i8* %17) #6, !dbg !211
  ret void, !dbg !212
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_17.c", directory: "/root/SSE-Assessment")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_17_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_17.c", directory: "/root/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "i", scope: !20, file: !21, line: 23, type: !10)
!25 = !DILocation(line: 23, column: 9, scope: !20)
!26 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 24, type: !4)
!27 = !DILocation(line: 24, column: 21, scope: !20)
!28 = !DILocation(line: 25, column: 10, scope: !20)
!29 = !DILocation(line: 26, column: 11, scope: !30)
!30 = distinct !DILexicalBlock(scope: !20, file: !21, line: 26, column: 5)
!31 = !DILocation(line: 26, column: 9, scope: !30)
!32 = !DILocation(line: 26, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !21, line: 26, column: 5)
!34 = !DILocation(line: 26, column: 18, scope: !33)
!35 = !DILocation(line: 26, column: 5, scope: !30)
!36 = !DILocation(line: 29, column: 33, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !21, line: 27, column: 5)
!38 = !DILocation(line: 29, column: 16, scope: !37)
!39 = !DILocation(line: 29, column: 14, scope: !37)
!40 = !DILocation(line: 30, column: 13, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !21, line: 30, column: 13)
!42 = !DILocation(line: 30, column: 18, scope: !41)
!43 = !DILocation(line: 30, column: 13, scope: !37)
!44 = !DILocation(line: 30, column: 28, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !21, line: 30, column: 27)
!46 = !DILocation(line: 31, column: 5, scope: !37)
!47 = !DILocation(line: 26, column: 24, scope: !33)
!48 = !DILocation(line: 26, column: 5, scope: !33)
!49 = distinct !{!49, !35, !50, !51}
!50 = !DILocation(line: 31, column: 5, scope: !30)
!51 = !{!"llvm.loop.mustprogress"}
!52 = !DILocalVariable(name: "source", scope: !53, file: !21, line: 33, type: !54)
!53 = distinct !DILexicalBlock(scope: !20, file: !21, line: 32, column: 5)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 100)
!57 = !DILocation(line: 33, column: 23, scope: !53)
!58 = !DILocalVariable(name: "i", scope: !59, file: !21, line: 35, type: !60)
!59 = distinct !DILexicalBlock(scope: !53, file: !21, line: 34, column: 9)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !61, line: 46, baseType: !62)
!61 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!62 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!63 = !DILocation(line: 35, column: 20, scope: !59)
!64 = !DILocation(line: 37, column: 20, scope: !65)
!65 = distinct !DILexicalBlock(scope: !59, file: !21, line: 37, column: 13)
!66 = !DILocation(line: 37, column: 18, scope: !65)
!67 = !DILocation(line: 37, column: 25, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !21, line: 37, column: 13)
!69 = !DILocation(line: 37, column: 27, scope: !68)
!70 = !DILocation(line: 37, column: 13, scope: !65)
!71 = !DILocation(line: 39, column: 24, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !21, line: 38, column: 13)
!73 = !DILocation(line: 39, column: 17, scope: !72)
!74 = !DILocation(line: 39, column: 27, scope: !72)
!75 = !DILocation(line: 39, column: 34, scope: !72)
!76 = !DILocation(line: 40, column: 24, scope: !72)
!77 = !DILocation(line: 40, column: 17, scope: !72)
!78 = !DILocation(line: 40, column: 27, scope: !72)
!79 = !DILocation(line: 40, column: 34, scope: !72)
!80 = !DILocation(line: 41, column: 13, scope: !72)
!81 = !DILocation(line: 37, column: 35, scope: !68)
!82 = !DILocation(line: 37, column: 13, scope: !68)
!83 = distinct !{!83, !70, !84, !51}
!84 = !DILocation(line: 41, column: 13, scope: !65)
!85 = !DILocalVariable(name: "i", scope: !86, file: !21, line: 44, type: !60)
!86 = distinct !DILexicalBlock(scope: !53, file: !21, line: 43, column: 9)
!87 = !DILocation(line: 44, column: 20, scope: !86)
!88 = !DILocation(line: 46, column: 20, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !21, line: 46, column: 13)
!90 = !DILocation(line: 46, column: 18, scope: !89)
!91 = !DILocation(line: 46, column: 25, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !21, line: 46, column: 13)
!93 = !DILocation(line: 46, column: 27, scope: !92)
!94 = !DILocation(line: 46, column: 13, scope: !89)
!95 = !DILocation(line: 48, column: 17, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !21, line: 47, column: 13)
!97 = !DILocation(line: 48, column: 22, scope: !96)
!98 = !DILocation(line: 48, column: 34, scope: !96)
!99 = !DILocation(line: 48, column: 27, scope: !96)
!100 = !DILocation(line: 49, column: 13, scope: !96)
!101 = !DILocation(line: 46, column: 35, scope: !92)
!102 = !DILocation(line: 46, column: 13, scope: !92)
!103 = distinct !{!103, !94, !104, !51}
!104 = !DILocation(line: 49, column: 13, scope: !89)
!105 = !DILocation(line: 50, column: 30, scope: !86)
!106 = !DILocation(line: 50, column: 13, scope: !86)
!107 = !DILocation(line: 51, column: 18, scope: !86)
!108 = !DILocation(line: 51, column: 13, scope: !86)
!109 = !DILocation(line: 54, column: 1, scope: !20)
!110 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_17_good", scope: !21, file: !21, line: 96, type: !22, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocation(line: 98, column: 5, scope: !110)
!112 = !DILocation(line: 99, column: 1, scope: !110)
!113 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 111, type: !114, scopeLine: 112, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DISubroutineType(types: !115)
!115 = !{!10, !10, !116}
!116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !117, size: 64)
!117 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !118, size: 64)
!118 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!119 = !DILocalVariable(name: "argc", arg: 1, scope: !113, file: !21, line: 111, type: !10)
!120 = !DILocation(line: 111, column: 14, scope: !113)
!121 = !DILocalVariable(name: "argv", arg: 2, scope: !113, file: !21, line: 111, type: !116)
!122 = !DILocation(line: 111, column: 27, scope: !113)
!123 = !DILocation(line: 114, column: 22, scope: !113)
!124 = !DILocation(line: 114, column: 12, scope: !113)
!125 = !DILocation(line: 114, column: 5, scope: !113)
!126 = !DILocation(line: 116, column: 5, scope: !113)
!127 = !DILocation(line: 117, column: 5, scope: !113)
!128 = !DILocation(line: 118, column: 5, scope: !113)
!129 = !DILocation(line: 121, column: 5, scope: !113)
!130 = !DILocation(line: 122, column: 5, scope: !113)
!131 = !DILocation(line: 123, column: 5, scope: !113)
!132 = !DILocation(line: 125, column: 5, scope: !113)
!133 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 61, type: !22, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!134 = !DILocalVariable(name: "h", scope: !133, file: !21, line: 63, type: !10)
!135 = !DILocation(line: 63, column: 9, scope: !133)
!136 = !DILocalVariable(name: "data", scope: !133, file: !21, line: 64, type: !4)
!137 = !DILocation(line: 64, column: 21, scope: !133)
!138 = !DILocation(line: 65, column: 10, scope: !133)
!139 = !DILocation(line: 66, column: 11, scope: !140)
!140 = distinct !DILexicalBlock(scope: !133, file: !21, line: 66, column: 5)
!141 = !DILocation(line: 66, column: 9, scope: !140)
!142 = !DILocation(line: 66, column: 16, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !21, line: 66, column: 5)
!144 = !DILocation(line: 66, column: 18, scope: !143)
!145 = !DILocation(line: 66, column: 5, scope: !140)
!146 = !DILocation(line: 69, column: 33, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !21, line: 67, column: 5)
!148 = !DILocation(line: 69, column: 16, scope: !147)
!149 = !DILocation(line: 69, column: 14, scope: !147)
!150 = !DILocation(line: 70, column: 13, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !21, line: 70, column: 13)
!152 = !DILocation(line: 70, column: 18, scope: !151)
!153 = !DILocation(line: 70, column: 13, scope: !147)
!154 = !DILocation(line: 70, column: 28, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !21, line: 70, column: 27)
!156 = !DILocation(line: 71, column: 5, scope: !147)
!157 = !DILocation(line: 66, column: 24, scope: !143)
!158 = !DILocation(line: 66, column: 5, scope: !143)
!159 = distinct !{!159, !145, !160, !51}
!160 = !DILocation(line: 71, column: 5, scope: !140)
!161 = !DILocalVariable(name: "source", scope: !162, file: !21, line: 73, type: !54)
!162 = distinct !DILexicalBlock(scope: !133, file: !21, line: 72, column: 5)
!163 = !DILocation(line: 73, column: 23, scope: !162)
!164 = !DILocalVariable(name: "i", scope: !165, file: !21, line: 75, type: !60)
!165 = distinct !DILexicalBlock(scope: !162, file: !21, line: 74, column: 9)
!166 = !DILocation(line: 75, column: 20, scope: !165)
!167 = !DILocation(line: 77, column: 20, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !21, line: 77, column: 13)
!169 = !DILocation(line: 77, column: 18, scope: !168)
!170 = !DILocation(line: 77, column: 25, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !21, line: 77, column: 13)
!172 = !DILocation(line: 77, column: 27, scope: !171)
!173 = !DILocation(line: 77, column: 13, scope: !168)
!174 = !DILocation(line: 79, column: 24, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !21, line: 78, column: 13)
!176 = !DILocation(line: 79, column: 17, scope: !175)
!177 = !DILocation(line: 79, column: 27, scope: !175)
!178 = !DILocation(line: 79, column: 34, scope: !175)
!179 = !DILocation(line: 80, column: 24, scope: !175)
!180 = !DILocation(line: 80, column: 17, scope: !175)
!181 = !DILocation(line: 80, column: 27, scope: !175)
!182 = !DILocation(line: 80, column: 34, scope: !175)
!183 = !DILocation(line: 81, column: 13, scope: !175)
!184 = !DILocation(line: 77, column: 35, scope: !171)
!185 = !DILocation(line: 77, column: 13, scope: !171)
!186 = distinct !{!186, !173, !187, !51}
!187 = !DILocation(line: 81, column: 13, scope: !168)
!188 = !DILocalVariable(name: "i", scope: !189, file: !21, line: 84, type: !60)
!189 = distinct !DILexicalBlock(scope: !162, file: !21, line: 83, column: 9)
!190 = !DILocation(line: 84, column: 20, scope: !189)
!191 = !DILocation(line: 86, column: 20, scope: !192)
!192 = distinct !DILexicalBlock(scope: !189, file: !21, line: 86, column: 13)
!193 = !DILocation(line: 86, column: 18, scope: !192)
!194 = !DILocation(line: 86, column: 25, scope: !195)
!195 = distinct !DILexicalBlock(scope: !192, file: !21, line: 86, column: 13)
!196 = !DILocation(line: 86, column: 27, scope: !195)
!197 = !DILocation(line: 86, column: 13, scope: !192)
!198 = !DILocation(line: 88, column: 17, scope: !199)
!199 = distinct !DILexicalBlock(scope: !195, file: !21, line: 87, column: 13)
!200 = !DILocation(line: 88, column: 22, scope: !199)
!201 = !DILocation(line: 88, column: 34, scope: !199)
!202 = !DILocation(line: 88, column: 27, scope: !199)
!203 = !DILocation(line: 89, column: 13, scope: !199)
!204 = !DILocation(line: 86, column: 35, scope: !195)
!205 = !DILocation(line: 86, column: 13, scope: !195)
!206 = distinct !{!206, !197, !207, !51}
!207 = !DILocation(line: 89, column: 13, scope: !192)
!208 = !DILocation(line: 90, column: 30, scope: !189)
!209 = !DILocation(line: 90, column: 13, scope: !189)
!210 = !DILocation(line: 91, column: 18, scope: !189)
!211 = !DILocation(line: 91, column: 13, scope: !189)
!212 = !DILocation(line: 94, column: 1, scope: !133)
