; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_67a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_67a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_67_structType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_67_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_67_structType, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_67_structType* %myStruct, metadata !19, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !35
  store i8* %arraydecay, i8** %data, align 8, !dbg !36
  %0 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %1 = load i8*, i8** %data, align 8, !dbg !39
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_67_structType* %myStruct, i32 0, i32 0, !dbg !40
  store i8* %1, i8** %structFirst, align 8, !dbg !41
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_67_structType* %myStruct, i32 0, i32 0, !dbg !42
  %2 = load i8*, i8** %coerce.dive, align 8, !dbg !42
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_67b_badSink(i8* %2), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_67b_badSink(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_67_good() #0 !dbg !44 {
entry:
  call void @goodG2B(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* null) #4, !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 %conv) #4, !dbg !58
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_67_good(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_67_bad(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !66 {
entry:
  %data = alloca i8*, align 8
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_67_structType, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_67_structType* %myStruct, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !75
  store i8* %arraydecay, i8** %data, align 8, !dbg !76
  %0 = load i8*, i8** %data, align 8, !dbg !77
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !77
  store i8 0, i8* %arrayidx, align 1, !dbg !78
  %1 = load i8*, i8** %data, align 8, !dbg !79
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_67_structType* %myStruct, i32 0, i32 0, !dbg !80
  store i8* %1, i8** %structFirst, align 8, !dbg !81
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_67_structType* %myStruct, i32 0, i32 0, !dbg !82
  %2 = load i8*, i8** %coerce.dive, align 8, !dbg !82
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_67b_goodG2BSink(i8* %2), !dbg !82
  ret void, !dbg !83
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_67b_goodG2BSink(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_67a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_67_bad", scope: !12, file: !12, line: 36, type: !13, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_67a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 38, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 38, column: 12, scope: !11)
!19 = !DILocalVariable(name: "myStruct", scope: !11, file: !12, line: 39, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_67_structType", file: !12, line: 29, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_67_structType", file: !12, line: 26, size: 64, elements: !22)
!22 = !{!23}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !21, file: !12, line: 28, baseType: !16, size: 64)
!24 = !DILocation(line: 39, column: 82, scope: !11)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 40, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 80, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 10)
!29 = !DILocation(line: 40, column: 10, scope: !11)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 41, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 88, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 11)
!34 = !DILocation(line: 41, column: 10, scope: !11)
!35 = !DILocation(line: 44, column: 12, scope: !11)
!36 = !DILocation(line: 44, column: 10, scope: !11)
!37 = !DILocation(line: 45, column: 5, scope: !11)
!38 = !DILocation(line: 45, column: 13, scope: !11)
!39 = !DILocation(line: 46, column: 28, scope: !11)
!40 = !DILocation(line: 46, column: 14, scope: !11)
!41 = !DILocation(line: 46, column: 26, scope: !11)
!42 = !DILocation(line: 47, column: 5, scope: !11)
!43 = !DILocation(line: 48, column: 1, scope: !11)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memcpy_67_good", scope: !12, file: !12, line: 71, type: !13, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 73, column: 5, scope: !44)
!46 = !DILocation(line: 74, column: 1, scope: !44)
!47 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 86, type: !48, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{!50, !50, !51}
!50 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !12, line: 86, type: !50)
!53 = !DILocation(line: 86, column: 14, scope: !47)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !12, line: 86, type: !51)
!55 = !DILocation(line: 86, column: 27, scope: !47)
!56 = !DILocation(line: 89, column: 22, scope: !47)
!57 = !DILocation(line: 89, column: 12, scope: !47)
!58 = !DILocation(line: 89, column: 5, scope: !47)
!59 = !DILocation(line: 91, column: 5, scope: !47)
!60 = !DILocation(line: 92, column: 5, scope: !47)
!61 = !DILocation(line: 93, column: 5, scope: !47)
!62 = !DILocation(line: 96, column: 5, scope: !47)
!63 = !DILocation(line: 97, column: 5, scope: !47)
!64 = !DILocation(line: 98, column: 5, scope: !47)
!65 = !DILocation(line: 100, column: 5, scope: !47)
!66 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 57, type: !13, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocalVariable(name: "data", scope: !66, file: !12, line: 59, type: !16)
!68 = !DILocation(line: 59, column: 12, scope: !66)
!69 = !DILocalVariable(name: "myStruct", scope: !66, file: !12, line: 60, type: !20)
!70 = !DILocation(line: 60, column: 82, scope: !66)
!71 = !DILocalVariable(name: "dataBadBuffer", scope: !66, file: !12, line: 61, type: !26)
!72 = !DILocation(line: 61, column: 10, scope: !66)
!73 = !DILocalVariable(name: "dataGoodBuffer", scope: !66, file: !12, line: 62, type: !31)
!74 = !DILocation(line: 62, column: 10, scope: !66)
!75 = !DILocation(line: 65, column: 12, scope: !66)
!76 = !DILocation(line: 65, column: 10, scope: !66)
!77 = !DILocation(line: 66, column: 5, scope: !66)
!78 = !DILocation(line: 66, column: 13, scope: !66)
!79 = !DILocation(line: 67, column: 28, scope: !66)
!80 = !DILocation(line: 67, column: 14, scope: !66)
!81 = !DILocation(line: 67, column: 26, scope: !66)
!82 = !DILocation(line: 68, column: 5, scope: !66)
!83 = !DILocation(line: 69, column: 1, scope: !66)
