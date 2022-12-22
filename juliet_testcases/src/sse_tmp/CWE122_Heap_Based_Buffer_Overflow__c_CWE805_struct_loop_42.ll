; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_42_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !27
  %call = call %struct._twoIntsStruct* @badSource(%struct._twoIntsStruct* %0), !dbg !28
  store %struct._twoIntsStruct* %call, %struct._twoIntsStruct** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !30, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !41
  store i64 0, i64* %i, align 8, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !45
  %cmp = icmp ult i64 %1, 100, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !51
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !52
  store i32 0, i32* %intOne, align 8, !dbg !53
  %3 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !55
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !56
  store i32 0, i32* %intTwo, align 4, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !59
  %inc = add i64 %4, 1, !dbg !59
  store i64 %inc, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !64, metadata !DIExpression()), !dbg !66
  store i64 0, i64* %i2, align 8, !dbg !67
  br label %for.cond3, !dbg !69

for.cond3:                                        ; preds = %for.inc8, %for.end
  %5 = load i64, i64* %i2, align 8, !dbg !70
  %cmp4 = icmp ult i64 %5, 100, !dbg !72
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !73

for.body5:                                        ; preds = %for.cond3
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !74
  %7 = load i64, i64* %i2, align 8, !dbg !76
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !74
  %8 = load i64, i64* %i2, align 8, !dbg !77
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !78
  %9 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !78
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !78
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !78
  br label %for.inc8, !dbg !79

for.inc8:                                         ; preds = %for.body5
  %11 = load i64, i64* %i2, align 8, !dbg !80
  %inc9 = add i64 %11, 1, !dbg !80
  store i64 %inc9, i64* %i2, align 8, !dbg !80
  br label %for.cond3, !dbg !81, !llvm.loop !82

for.end10:                                        ; preds = %for.cond3
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !84
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !84
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !85
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !86
  %14 = bitcast %struct._twoIntsStruct* %13 to i8*, !dbg !86
  call void @free(i8* %14) #6, !dbg !87
  ret void, !dbg !88
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal %struct._twoIntsStruct* @badSource(%struct._twoIntsStruct* %data) #0 !dbg !89 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !94
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !95
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data.addr, align 8, !dbg !96
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !97
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !99
  br i1 %cmp, label %if.then, label %if.end, !dbg !100

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !101
  unreachable, !dbg !101

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !103
  ret %struct._twoIntsStruct* %2, !dbg !104
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_42_good() #0 !dbg !105 {
entry:
  call void @goodG2B(), !dbg !106
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !108 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !114, metadata !DIExpression()), !dbg !115
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !116, metadata !DIExpression()), !dbg !117
  %call = call i64 @time(i64* null) #6, !dbg !118
  %conv = trunc i64 %call to i32, !dbg !119
  call void @srand(i32 %conv) #6, !dbg !120
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !121
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_42_good(), !dbg !122
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !123
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !124
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_42_bad(), !dbg !125
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !126
  ret i32 0, !dbg !127
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #4

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !128 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !129, metadata !DIExpression()), !dbg !130
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !131
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !132
  %call = call %struct._twoIntsStruct* @goodG2BSource(%struct._twoIntsStruct* %0), !dbg !133
  store %struct._twoIntsStruct* %call, %struct._twoIntsStruct** %data, align 8, !dbg !134
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !135, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata i64* %i, metadata !138, metadata !DIExpression()), !dbg !140
  store i64 0, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !143

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !144
  %cmp = icmp ult i64 %1, 100, !dbg !146
  br i1 %cmp, label %for.body, label %for.end, !dbg !147

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !150
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !151
  store i32 0, i32* %intOne, align 8, !dbg !152
  %3 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !154
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !155
  store i32 0, i32* %intTwo, align 4, !dbg !156
  br label %for.inc, !dbg !157

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !158
  %inc = add i64 %4, 1, !dbg !158
  store i64 %inc, i64* %i, align 8, !dbg !158
  br label %for.cond, !dbg !159, !llvm.loop !160

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !162, metadata !DIExpression()), !dbg !164
  store i64 0, i64* %i2, align 8, !dbg !165
  br label %for.cond3, !dbg !167

for.cond3:                                        ; preds = %for.inc8, %for.end
  %5 = load i64, i64* %i2, align 8, !dbg !168
  %cmp4 = icmp ult i64 %5, 100, !dbg !170
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !171

for.body5:                                        ; preds = %for.cond3
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !172
  %7 = load i64, i64* %i2, align 8, !dbg !174
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !172
  %8 = load i64, i64* %i2, align 8, !dbg !175
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !176
  %9 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !176
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !176
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !176
  br label %for.inc8, !dbg !177

for.inc8:                                         ; preds = %for.body5
  %11 = load i64, i64* %i2, align 8, !dbg !178
  %inc9 = add i64 %11, 1, !dbg !178
  store i64 %inc9, i64* %i2, align 8, !dbg !178
  br label %for.cond3, !dbg !179, !llvm.loop !180

for.end10:                                        ; preds = %for.cond3
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !182
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !182
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !183
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !184
  %14 = bitcast %struct._twoIntsStruct* %13 to i8*, !dbg !184
  call void @free(i8* %14) #6, !dbg !185
  ret void, !dbg !186
}

; Function Attrs: noinline nounwind uwtable
define internal %struct._twoIntsStruct* @goodG2BSource(%struct._twoIntsStruct* %data) #0 !dbg !187 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !188, metadata !DIExpression()), !dbg !189
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !190
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !191
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data.addr, align 8, !dbg !192
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !193
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !195
  br i1 %cmp, label %if.then, label %if.end, !dbg !196

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !197
  unreachable, !dbg !197

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !199
  ret %struct._twoIntsStruct* %2, !dbg !200
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_42.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !13}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !7, line: 100, baseType: !8)
!7 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !7, line: 96, size: 64, elements: !9)
!9 = !{!10, !12}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !8, file: !7, line: 98, baseType: !11, size: 32)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !8, file: !7, line: 99, baseType: !11, size: 32, offset: 32)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_42_bad", scope: !21, file: !21, line: 29, type: !22, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_42.c", directory: "/root/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 31, type: !5)
!25 = !DILocation(line: 31, column: 21, scope: !20)
!26 = !DILocation(line: 32, column: 10, scope: !20)
!27 = !DILocation(line: 33, column: 22, scope: !20)
!28 = !DILocation(line: 33, column: 12, scope: !20)
!29 = !DILocation(line: 33, column: 10, scope: !20)
!30 = !DILocalVariable(name: "source", scope: !31, file: !21, line: 35, type: !32)
!31 = distinct !DILexicalBlock(scope: !20, file: !21, line: 34, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 6400, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 35, column: 23, scope: !31)
!36 = !DILocalVariable(name: "i", scope: !37, file: !21, line: 37, type: !38)
!37 = distinct !DILexicalBlock(scope: !31, file: !21, line: 36, column: 9)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!40 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 37, column: 20, scope: !37)
!42 = !DILocation(line: 39, column: 20, scope: !43)
!43 = distinct !DILexicalBlock(scope: !37, file: !21, line: 39, column: 13)
!44 = !DILocation(line: 39, column: 18, scope: !43)
!45 = !DILocation(line: 39, column: 25, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !21, line: 39, column: 13)
!47 = !DILocation(line: 39, column: 27, scope: !46)
!48 = !DILocation(line: 39, column: 13, scope: !43)
!49 = !DILocation(line: 41, column: 24, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !21, line: 40, column: 13)
!51 = !DILocation(line: 41, column: 17, scope: !50)
!52 = !DILocation(line: 41, column: 27, scope: !50)
!53 = !DILocation(line: 41, column: 34, scope: !50)
!54 = !DILocation(line: 42, column: 24, scope: !50)
!55 = !DILocation(line: 42, column: 17, scope: !50)
!56 = !DILocation(line: 42, column: 27, scope: !50)
!57 = !DILocation(line: 42, column: 34, scope: !50)
!58 = !DILocation(line: 43, column: 13, scope: !50)
!59 = !DILocation(line: 39, column: 35, scope: !46)
!60 = !DILocation(line: 39, column: 13, scope: !46)
!61 = distinct !{!61, !48, !62, !63}
!62 = !DILocation(line: 43, column: 13, scope: !43)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocalVariable(name: "i", scope: !65, file: !21, line: 46, type: !38)
!65 = distinct !DILexicalBlock(scope: !31, file: !21, line: 45, column: 9)
!66 = !DILocation(line: 46, column: 20, scope: !65)
!67 = !DILocation(line: 48, column: 20, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !21, line: 48, column: 13)
!69 = !DILocation(line: 48, column: 18, scope: !68)
!70 = !DILocation(line: 48, column: 25, scope: !71)
!71 = distinct !DILexicalBlock(scope: !68, file: !21, line: 48, column: 13)
!72 = !DILocation(line: 48, column: 27, scope: !71)
!73 = !DILocation(line: 48, column: 13, scope: !68)
!74 = !DILocation(line: 50, column: 17, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !21, line: 49, column: 13)
!76 = !DILocation(line: 50, column: 22, scope: !75)
!77 = !DILocation(line: 50, column: 34, scope: !75)
!78 = !DILocation(line: 50, column: 27, scope: !75)
!79 = !DILocation(line: 51, column: 13, scope: !75)
!80 = !DILocation(line: 48, column: 35, scope: !71)
!81 = !DILocation(line: 48, column: 13, scope: !71)
!82 = distinct !{!82, !73, !83, !63}
!83 = !DILocation(line: 51, column: 13, scope: !68)
!84 = !DILocation(line: 52, column: 30, scope: !65)
!85 = !DILocation(line: 52, column: 13, scope: !65)
!86 = !DILocation(line: 53, column: 18, scope: !65)
!87 = !DILocation(line: 53, column: 13, scope: !65)
!88 = !DILocation(line: 56, column: 1, scope: !20)
!89 = distinct !DISubprogram(name: "badSource", scope: !21, file: !21, line: 21, type: !90, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DISubroutineType(types: !91)
!91 = !{!5, !5}
!92 = !DILocalVariable(name: "data", arg: 1, scope: !89, file: !21, line: 21, type: !5)
!93 = !DILocation(line: 21, column: 50, scope: !89)
!94 = !DILocation(line: 24, column: 29, scope: !89)
!95 = !DILocation(line: 24, column: 12, scope: !89)
!96 = !DILocation(line: 24, column: 10, scope: !89)
!97 = !DILocation(line: 25, column: 9, scope: !98)
!98 = distinct !DILexicalBlock(scope: !89, file: !21, line: 25, column: 9)
!99 = !DILocation(line: 25, column: 14, scope: !98)
!100 = !DILocation(line: 25, column: 9, scope: !89)
!101 = !DILocation(line: 25, column: 24, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !21, line: 25, column: 23)
!103 = !DILocation(line: 26, column: 12, scope: !89)
!104 = !DILocation(line: 26, column: 5, scope: !89)
!105 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_42_good", scope: !21, file: !21, line: 100, type: !22, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocation(line: 102, column: 5, scope: !105)
!107 = !DILocation(line: 103, column: 1, scope: !105)
!108 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 115, type: !109, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DISubroutineType(types: !110)
!110 = !{!11, !11, !111}
!111 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !112, size: 64)
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64)
!113 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!114 = !DILocalVariable(name: "argc", arg: 1, scope: !108, file: !21, line: 115, type: !11)
!115 = !DILocation(line: 115, column: 14, scope: !108)
!116 = !DILocalVariable(name: "argv", arg: 2, scope: !108, file: !21, line: 115, type: !111)
!117 = !DILocation(line: 115, column: 27, scope: !108)
!118 = !DILocation(line: 118, column: 22, scope: !108)
!119 = !DILocation(line: 118, column: 12, scope: !108)
!120 = !DILocation(line: 118, column: 5, scope: !108)
!121 = !DILocation(line: 120, column: 5, scope: !108)
!122 = !DILocation(line: 121, column: 5, scope: !108)
!123 = !DILocation(line: 122, column: 5, scope: !108)
!124 = !DILocation(line: 125, column: 5, scope: !108)
!125 = !DILocation(line: 126, column: 5, scope: !108)
!126 = !DILocation(line: 127, column: 5, scope: !108)
!127 = !DILocation(line: 129, column: 5, scope: !108)
!128 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 71, type: !22, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!129 = !DILocalVariable(name: "data", scope: !128, file: !21, line: 73, type: !5)
!130 = !DILocation(line: 73, column: 21, scope: !128)
!131 = !DILocation(line: 74, column: 10, scope: !128)
!132 = !DILocation(line: 75, column: 26, scope: !128)
!133 = !DILocation(line: 75, column: 12, scope: !128)
!134 = !DILocation(line: 75, column: 10, scope: !128)
!135 = !DILocalVariable(name: "source", scope: !136, file: !21, line: 77, type: !32)
!136 = distinct !DILexicalBlock(scope: !128, file: !21, line: 76, column: 5)
!137 = !DILocation(line: 77, column: 23, scope: !136)
!138 = !DILocalVariable(name: "i", scope: !139, file: !21, line: 79, type: !38)
!139 = distinct !DILexicalBlock(scope: !136, file: !21, line: 78, column: 9)
!140 = !DILocation(line: 79, column: 20, scope: !139)
!141 = !DILocation(line: 81, column: 20, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !21, line: 81, column: 13)
!143 = !DILocation(line: 81, column: 18, scope: !142)
!144 = !DILocation(line: 81, column: 25, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !21, line: 81, column: 13)
!146 = !DILocation(line: 81, column: 27, scope: !145)
!147 = !DILocation(line: 81, column: 13, scope: !142)
!148 = !DILocation(line: 83, column: 24, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !21, line: 82, column: 13)
!150 = !DILocation(line: 83, column: 17, scope: !149)
!151 = !DILocation(line: 83, column: 27, scope: !149)
!152 = !DILocation(line: 83, column: 34, scope: !149)
!153 = !DILocation(line: 84, column: 24, scope: !149)
!154 = !DILocation(line: 84, column: 17, scope: !149)
!155 = !DILocation(line: 84, column: 27, scope: !149)
!156 = !DILocation(line: 84, column: 34, scope: !149)
!157 = !DILocation(line: 85, column: 13, scope: !149)
!158 = !DILocation(line: 81, column: 35, scope: !145)
!159 = !DILocation(line: 81, column: 13, scope: !145)
!160 = distinct !{!160, !147, !161, !63}
!161 = !DILocation(line: 85, column: 13, scope: !142)
!162 = !DILocalVariable(name: "i", scope: !163, file: !21, line: 88, type: !38)
!163 = distinct !DILexicalBlock(scope: !136, file: !21, line: 87, column: 9)
!164 = !DILocation(line: 88, column: 20, scope: !163)
!165 = !DILocation(line: 90, column: 20, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !21, line: 90, column: 13)
!167 = !DILocation(line: 90, column: 18, scope: !166)
!168 = !DILocation(line: 90, column: 25, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !21, line: 90, column: 13)
!170 = !DILocation(line: 90, column: 27, scope: !169)
!171 = !DILocation(line: 90, column: 13, scope: !166)
!172 = !DILocation(line: 92, column: 17, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !21, line: 91, column: 13)
!174 = !DILocation(line: 92, column: 22, scope: !173)
!175 = !DILocation(line: 92, column: 34, scope: !173)
!176 = !DILocation(line: 92, column: 27, scope: !173)
!177 = !DILocation(line: 93, column: 13, scope: !173)
!178 = !DILocation(line: 90, column: 35, scope: !169)
!179 = !DILocation(line: 90, column: 13, scope: !169)
!180 = distinct !{!180, !171, !181, !63}
!181 = !DILocation(line: 93, column: 13, scope: !166)
!182 = !DILocation(line: 94, column: 30, scope: !163)
!183 = !DILocation(line: 94, column: 13, scope: !163)
!184 = !DILocation(line: 95, column: 18, scope: !163)
!185 = !DILocation(line: 95, column: 13, scope: !163)
!186 = !DILocation(line: 98, column: 1, scope: !128)
!187 = distinct !DISubprogram(name: "goodG2BSource", scope: !21, file: !21, line: 62, type: !90, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!188 = !DILocalVariable(name: "data", arg: 1, scope: !187, file: !21, line: 62, type: !5)
!189 = !DILocation(line: 62, column: 54, scope: !187)
!190 = !DILocation(line: 65, column: 29, scope: !187)
!191 = !DILocation(line: 65, column: 12, scope: !187)
!192 = !DILocation(line: 65, column: 10, scope: !187)
!193 = !DILocation(line: 66, column: 9, scope: !194)
!194 = distinct !DILexicalBlock(scope: !187, file: !21, line: 66, column: 9)
!195 = !DILocation(line: 66, column: 14, scope: !194)
!196 = !DILocation(line: 66, column: 9, scope: !187)
!197 = !DILocation(line: 66, column: 24, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !21, line: 66, column: 23)
!199 = !DILocation(line: 67, column: 12, scope: !187)
!200 = !DILocation(line: 67, column: 5, scope: !187)
