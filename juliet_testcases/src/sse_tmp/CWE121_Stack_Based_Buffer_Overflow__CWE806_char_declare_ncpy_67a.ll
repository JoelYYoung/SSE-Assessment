; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_67a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_67a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_67_structType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_67_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_67_structType, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_67_structType* %myStruct, metadata !19, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !30
  store i8* %arraydecay, i8** %data, align 8, !dbg !31
  %0 = load i8*, i8** %data, align 8, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !33
  %1 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  %2 = load i8*, i8** %data, align 8, !dbg !36
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_67_structType* %myStruct, i32 0, i32 0, !dbg !37
  store i8* %2, i8** %structFirst, align 8, !dbg !38
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_67_structType* %myStruct, i32 0, i32 0, !dbg !39
  %3 = load i8*, i8** %coerce.dive, align 8, !dbg !39
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_67b_badSink(i8* %3), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_67b_badSink(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_67_good() #0 !dbg !41 {
entry:
  call void @goodG2B(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %call = call i64 @time(i64* null) #5, !dbg !53
  %conv = trunc i64 %call to i32, !dbg !54
  call void @srand(i32 %conv) #5, !dbg !55
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_67_good(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !59
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_67_bad(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !61
  ret i32 0, !dbg !62
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !63 {
entry:
  %data = alloca i8*, align 8
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_67_structType, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_67_structType* %myStruct, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !68, metadata !DIExpression()), !dbg !69
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !70
  store i8* %arraydecay, i8** %data, align 8, !dbg !71
  %0 = load i8*, i8** %data, align 8, !dbg !72
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !73
  %1 = load i8*, i8** %data, align 8, !dbg !74
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !74
  store i8 0, i8* %arrayidx, align 1, !dbg !75
  %2 = load i8*, i8** %data, align 8, !dbg !76
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_67_structType* %myStruct, i32 0, i32 0, !dbg !77
  store i8* %2, i8** %structFirst, align 8, !dbg !78
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_67_structType* %myStruct, i32 0, i32 0, !dbg !79
  %3 = load i8*, i8** %coerce.dive, align 8, !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_67b_goodG2BSink(i8* %3), !dbg !79
  ret void, !dbg !80
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_67b_goodG2BSink(i8*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_67a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_67_bad", scope: !12, file: !12, line: 31, type: !13, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_67a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 33, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 33, column: 12, scope: !11)
!19 = !DILocalVariable(name: "myStruct", scope: !11, file: !12, line: 34, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_67_structType", file: !12, line: 24, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_67_structType", file: !12, line: 21, size: 64, elements: !22)
!22 = !{!23}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !21, file: !12, line: 23, baseType: !16, size: 64)
!24 = !DILocation(line: 34, column: 80, scope: !11)
!25 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 35, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 35, column: 10, scope: !11)
!30 = !DILocation(line: 36, column: 12, scope: !11)
!31 = !DILocation(line: 36, column: 10, scope: !11)
!32 = !DILocation(line: 38, column: 12, scope: !11)
!33 = !DILocation(line: 38, column: 5, scope: !11)
!34 = !DILocation(line: 39, column: 5, scope: !11)
!35 = !DILocation(line: 39, column: 17, scope: !11)
!36 = !DILocation(line: 40, column: 28, scope: !11)
!37 = !DILocation(line: 40, column: 14, scope: !11)
!38 = !DILocation(line: 40, column: 26, scope: !11)
!39 = !DILocation(line: 41, column: 5, scope: !11)
!40 = !DILocation(line: 42, column: 1, scope: !11)
!41 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_67_good", scope: !12, file: !12, line: 64, type: !13, scopeLine: 65, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocation(line: 66, column: 5, scope: !41)
!43 = !DILocation(line: 67, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 79, type: !45, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{!47, !47, !48}
!47 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !12, line: 79, type: !47)
!50 = !DILocation(line: 79, column: 14, scope: !44)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !12, line: 79, type: !48)
!52 = !DILocation(line: 79, column: 27, scope: !44)
!53 = !DILocation(line: 82, column: 22, scope: !44)
!54 = !DILocation(line: 82, column: 12, scope: !44)
!55 = !DILocation(line: 82, column: 5, scope: !44)
!56 = !DILocation(line: 84, column: 5, scope: !44)
!57 = !DILocation(line: 85, column: 5, scope: !44)
!58 = !DILocation(line: 86, column: 5, scope: !44)
!59 = !DILocation(line: 89, column: 5, scope: !44)
!60 = !DILocation(line: 90, column: 5, scope: !44)
!61 = !DILocation(line: 91, column: 5, scope: !44)
!62 = !DILocation(line: 93, column: 5, scope: !44)
!63 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocalVariable(name: "data", scope: !63, file: !12, line: 53, type: !16)
!65 = !DILocation(line: 53, column: 12, scope: !63)
!66 = !DILocalVariable(name: "myStruct", scope: !63, file: !12, line: 54, type: !20)
!67 = !DILocation(line: 54, column: 80, scope: !63)
!68 = !DILocalVariable(name: "dataBuffer", scope: !63, file: !12, line: 55, type: !26)
!69 = !DILocation(line: 55, column: 10, scope: !63)
!70 = !DILocation(line: 56, column: 12, scope: !63)
!71 = !DILocation(line: 56, column: 10, scope: !63)
!72 = !DILocation(line: 58, column: 12, scope: !63)
!73 = !DILocation(line: 58, column: 5, scope: !63)
!74 = !DILocation(line: 59, column: 5, scope: !63)
!75 = !DILocation(line: 59, column: 16, scope: !63)
!76 = !DILocation(line: 60, column: 28, scope: !63)
!77 = !DILocation(line: 60, column: 14, scope: !63)
!78 = !DILocation(line: 60, column: 26, scope: !63)
!79 = !DILocation(line: 61, column: 5, scope: !63)
!80 = !DILocation(line: 62, column: 1, scope: !63)
