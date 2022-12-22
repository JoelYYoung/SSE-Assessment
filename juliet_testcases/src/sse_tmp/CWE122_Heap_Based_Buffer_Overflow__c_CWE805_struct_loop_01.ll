; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_01.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_01_bad() #0 !dbg !20 {
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_01_good() #0 !dbg !95 {
entry:
  call void @goodG2B(), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !98 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !104, metadata !DIExpression()), !dbg !105
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !106, metadata !DIExpression()), !dbg !107
  %call = call i64 @time(i64* null) #6, !dbg !108
  %conv = trunc i64 %call to i32, !dbg !109
  call void @srand(i32 %conv) #6, !dbg !110
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !111
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_01_good(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !114
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_01_bad(), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !116
  ret i32 0, !dbg !117
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !118 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !119, metadata !DIExpression()), !dbg !120
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !121
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !122
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !123
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !124
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !125
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !127
  br i1 %cmp, label %if.then, label %if.end, !dbg !128

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !129
  unreachable, !dbg !129

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !131, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata i64* %i, metadata !134, metadata !DIExpression()), !dbg !136
  store i64 0, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !140
  %cmp1 = icmp ult i64 %2, 100, !dbg !142
  br i1 %cmp1, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !146
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !147
  store i32 0, i32* %intOne, align 8, !dbg !148
  %4 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !150
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !151
  store i32 0, i32* %intTwo, align 4, !dbg !152
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !154
  %inc = add i64 %5, 1, !dbg !154
  store i64 %inc, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !158, metadata !DIExpression()), !dbg !160
  store i64 0, i64* %i3, align 8, !dbg !161
  br label %for.cond4, !dbg !163

for.cond4:                                        ; preds = %for.inc9, %for.end
  %6 = load i64, i64* %i3, align 8, !dbg !164
  %cmp5 = icmp ult i64 %6, 100, !dbg !166
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !167

for.body6:                                        ; preds = %for.cond4
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !168
  %8 = load i64, i64* %i3, align 8, !dbg !170
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %8, !dbg !168
  %9 = load i64, i64* %i3, align 8, !dbg !171
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !172
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !172
  %11 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !172
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 8 %11, i64 8, i1 false), !dbg !172
  br label %for.inc9, !dbg !173

for.inc9:                                         ; preds = %for.body6
  %12 = load i64, i64* %i3, align 8, !dbg !174
  %inc10 = add i64 %12, 1, !dbg !174
  store i64 %inc10, i64* %i3, align 8, !dbg !174
  br label %for.cond4, !dbg !175, !llvm.loop !176

for.end11:                                        ; preds = %for.cond4
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !178
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !178
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !179
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !180
  %15 = bitcast %struct._twoIntsStruct* %14 to i8*, !dbg !180
  call void @free(i8* %15) #6, !dbg !181
  ret void, !dbg !182
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_01.c", directory: "/root/SSE-Assessment")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_01_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_01.c", directory: "/root/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 23, type: !4)
!25 = !DILocation(line: 23, column: 21, scope: !20)
!26 = !DILocation(line: 24, column: 10, scope: !20)
!27 = !DILocation(line: 26, column: 29, scope: !20)
!28 = !DILocation(line: 26, column: 12, scope: !20)
!29 = !DILocation(line: 26, column: 10, scope: !20)
!30 = !DILocation(line: 27, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !20, file: !21, line: 27, column: 9)
!32 = !DILocation(line: 27, column: 14, scope: !31)
!33 = !DILocation(line: 27, column: 9, scope: !20)
!34 = !DILocation(line: 27, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !21, line: 27, column: 23)
!36 = !DILocalVariable(name: "source", scope: !37, file: !21, line: 29, type: !38)
!37 = distinct !DILexicalBlock(scope: !20, file: !21, line: 28, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 29, column: 23, scope: !37)
!42 = !DILocalVariable(name: "i", scope: !43, file: !21, line: 31, type: !44)
!43 = distinct !DILexicalBlock(scope: !37, file: !21, line: 30, column: 9)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 46, baseType: !46)
!45 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 31, column: 20, scope: !43)
!48 = !DILocation(line: 33, column: 20, scope: !49)
!49 = distinct !DILexicalBlock(scope: !43, file: !21, line: 33, column: 13)
!50 = !DILocation(line: 33, column: 18, scope: !49)
!51 = !DILocation(line: 33, column: 25, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !21, line: 33, column: 13)
!53 = !DILocation(line: 33, column: 27, scope: !52)
!54 = !DILocation(line: 33, column: 13, scope: !49)
!55 = !DILocation(line: 35, column: 24, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !21, line: 34, column: 13)
!57 = !DILocation(line: 35, column: 17, scope: !56)
!58 = !DILocation(line: 35, column: 27, scope: !56)
!59 = !DILocation(line: 35, column: 34, scope: !56)
!60 = !DILocation(line: 36, column: 24, scope: !56)
!61 = !DILocation(line: 36, column: 17, scope: !56)
!62 = !DILocation(line: 36, column: 27, scope: !56)
!63 = !DILocation(line: 36, column: 34, scope: !56)
!64 = !DILocation(line: 37, column: 13, scope: !56)
!65 = !DILocation(line: 33, column: 35, scope: !52)
!66 = !DILocation(line: 33, column: 13, scope: !52)
!67 = distinct !{!67, !54, !68, !69}
!68 = !DILocation(line: 37, column: 13, scope: !49)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocalVariable(name: "i", scope: !71, file: !21, line: 40, type: !44)
!71 = distinct !DILexicalBlock(scope: !37, file: !21, line: 39, column: 9)
!72 = !DILocation(line: 40, column: 20, scope: !71)
!73 = !DILocation(line: 42, column: 20, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !21, line: 42, column: 13)
!75 = !DILocation(line: 42, column: 18, scope: !74)
!76 = !DILocation(line: 42, column: 25, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !21, line: 42, column: 13)
!78 = !DILocation(line: 42, column: 27, scope: !77)
!79 = !DILocation(line: 42, column: 13, scope: !74)
!80 = !DILocation(line: 44, column: 17, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !21, line: 43, column: 13)
!82 = !DILocation(line: 44, column: 22, scope: !81)
!83 = !DILocation(line: 44, column: 34, scope: !81)
!84 = !DILocation(line: 44, column: 27, scope: !81)
!85 = !DILocation(line: 45, column: 13, scope: !81)
!86 = !DILocation(line: 42, column: 35, scope: !77)
!87 = !DILocation(line: 42, column: 13, scope: !77)
!88 = distinct !{!88, !79, !89, !69}
!89 = !DILocation(line: 45, column: 13, scope: !74)
!90 = !DILocation(line: 46, column: 30, scope: !71)
!91 = !DILocation(line: 46, column: 13, scope: !71)
!92 = !DILocation(line: 47, column: 18, scope: !71)
!93 = !DILocation(line: 47, column: 13, scope: !71)
!94 = !DILocation(line: 50, column: 1, scope: !20)
!95 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_01_good", scope: !21, file: !21, line: 88, type: !22, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocation(line: 90, column: 5, scope: !95)
!97 = !DILocation(line: 91, column: 1, scope: !95)
!98 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 103, type: !99, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DISubroutineType(types: !100)
!100 = !{!10, !10, !101}
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!104 = !DILocalVariable(name: "argc", arg: 1, scope: !98, file: !21, line: 103, type: !10)
!105 = !DILocation(line: 103, column: 14, scope: !98)
!106 = !DILocalVariable(name: "argv", arg: 2, scope: !98, file: !21, line: 103, type: !101)
!107 = !DILocation(line: 103, column: 27, scope: !98)
!108 = !DILocation(line: 106, column: 22, scope: !98)
!109 = !DILocation(line: 106, column: 12, scope: !98)
!110 = !DILocation(line: 106, column: 5, scope: !98)
!111 = !DILocation(line: 108, column: 5, scope: !98)
!112 = !DILocation(line: 109, column: 5, scope: !98)
!113 = !DILocation(line: 110, column: 5, scope: !98)
!114 = !DILocation(line: 113, column: 5, scope: !98)
!115 = !DILocation(line: 114, column: 5, scope: !98)
!116 = !DILocation(line: 115, column: 5, scope: !98)
!117 = !DILocation(line: 117, column: 5, scope: !98)
!118 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 57, type: !22, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!119 = !DILocalVariable(name: "data", scope: !118, file: !21, line: 59, type: !4)
!120 = !DILocation(line: 59, column: 21, scope: !118)
!121 = !DILocation(line: 60, column: 10, scope: !118)
!122 = !DILocation(line: 62, column: 29, scope: !118)
!123 = !DILocation(line: 62, column: 12, scope: !118)
!124 = !DILocation(line: 62, column: 10, scope: !118)
!125 = !DILocation(line: 63, column: 9, scope: !126)
!126 = distinct !DILexicalBlock(scope: !118, file: !21, line: 63, column: 9)
!127 = !DILocation(line: 63, column: 14, scope: !126)
!128 = !DILocation(line: 63, column: 9, scope: !118)
!129 = !DILocation(line: 63, column: 24, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !21, line: 63, column: 23)
!131 = !DILocalVariable(name: "source", scope: !132, file: !21, line: 65, type: !38)
!132 = distinct !DILexicalBlock(scope: !118, file: !21, line: 64, column: 5)
!133 = !DILocation(line: 65, column: 23, scope: !132)
!134 = !DILocalVariable(name: "i", scope: !135, file: !21, line: 67, type: !44)
!135 = distinct !DILexicalBlock(scope: !132, file: !21, line: 66, column: 9)
!136 = !DILocation(line: 67, column: 20, scope: !135)
!137 = !DILocation(line: 69, column: 20, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !21, line: 69, column: 13)
!139 = !DILocation(line: 69, column: 18, scope: !138)
!140 = !DILocation(line: 69, column: 25, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !21, line: 69, column: 13)
!142 = !DILocation(line: 69, column: 27, scope: !141)
!143 = !DILocation(line: 69, column: 13, scope: !138)
!144 = !DILocation(line: 71, column: 24, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !21, line: 70, column: 13)
!146 = !DILocation(line: 71, column: 17, scope: !145)
!147 = !DILocation(line: 71, column: 27, scope: !145)
!148 = !DILocation(line: 71, column: 34, scope: !145)
!149 = !DILocation(line: 72, column: 24, scope: !145)
!150 = !DILocation(line: 72, column: 17, scope: !145)
!151 = !DILocation(line: 72, column: 27, scope: !145)
!152 = !DILocation(line: 72, column: 34, scope: !145)
!153 = !DILocation(line: 73, column: 13, scope: !145)
!154 = !DILocation(line: 69, column: 35, scope: !141)
!155 = !DILocation(line: 69, column: 13, scope: !141)
!156 = distinct !{!156, !143, !157, !69}
!157 = !DILocation(line: 73, column: 13, scope: !138)
!158 = !DILocalVariable(name: "i", scope: !159, file: !21, line: 76, type: !44)
!159 = distinct !DILexicalBlock(scope: !132, file: !21, line: 75, column: 9)
!160 = !DILocation(line: 76, column: 20, scope: !159)
!161 = !DILocation(line: 78, column: 20, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !21, line: 78, column: 13)
!163 = !DILocation(line: 78, column: 18, scope: !162)
!164 = !DILocation(line: 78, column: 25, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !21, line: 78, column: 13)
!166 = !DILocation(line: 78, column: 27, scope: !165)
!167 = !DILocation(line: 78, column: 13, scope: !162)
!168 = !DILocation(line: 80, column: 17, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !21, line: 79, column: 13)
!170 = !DILocation(line: 80, column: 22, scope: !169)
!171 = !DILocation(line: 80, column: 34, scope: !169)
!172 = !DILocation(line: 80, column: 27, scope: !169)
!173 = !DILocation(line: 81, column: 13, scope: !169)
!174 = !DILocation(line: 78, column: 35, scope: !165)
!175 = !DILocation(line: 78, column: 13, scope: !165)
!176 = distinct !{!176, !167, !177, !69}
!177 = !DILocation(line: 81, column: 13, scope: !162)
!178 = !DILocation(line: 82, column: 30, scope: !159)
!179 = !DILocation(line: 82, column: 13, scope: !159)
!180 = !DILocation(line: 83, column: 18, scope: !159)
!181 = !DILocation(line: 83, column: 13, scope: !159)
!182 = !DILocation(line: 86, column: 1, scope: !118)
